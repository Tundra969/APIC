$UserInputRoutes = $args[0]
$UserInputStop = $args[1]
$UserInputDirection = $args[2]

# Headers for MetroTransit Site to give back JSON
$headers = @{
"Content-Type" = "application/json"
"Accept" = "application/json"
}

# Time Right Now
$Now = [datetime]::Now.ToUniversalTime()

# GetRoutes
$GetRoutes = Invoke-RestMethod -Uri http://svc.metrotransit.org/NexTrip/Routes -Method Get -Headers $headers

# GetRoutesValue - Find UserInputRoute within GetRoutes
$GetRoutesValue = $GetRoutes -match $UserInputRoutes | select -expand Route

# GetDirections - Use Route # from GetRoutesValue
$GetDirections = Invoke-RestMethod -Uri http://svc.metrotransit.org/NexTrip/Directions/$GetRoutesValue -Method Get -Headers $headers 

# GetDirectionsValue - Find UserInputDirection within GetDirections
$GetDirectionsValue = $GetDirections -match $UserInputDirection | select -expand Value

# GetStops - Use Route # from GetRoutesValue & Direction # from GetDirectionsValue
$GetStops = Invoke-RestMethod -Uri http://svc.metrotransit.org/NexTrip/Stops/$GetRoutesValue/$GetDirectionsValue -Method Get -Headers $headers

# GetStopsValue - Find UserInputStop within GetStops
$GetStopsValue = $GetStops -match $UserInputStop | select -expand Value

# GetTimepointDepartures - Use Route #, Direction #, & Stop 4-digit code
$GetTimepointDepartures = Invoke-RestMethod -Uri http://svc.metrotransit.org/NexTrip/$GetRoutesValue/$GetDirectionsValue/$GetStopsValue -Method Get -Headers $headers

# GetNextTimeToDeparture - Find the first departure from GetTimepointDepartures List
$GetNextTimepointDeparture = ($GetTimepointDepartures | select -expand DepartureTime -First 1)

# TimeToDeparture - 
$TimeToDeparture = ($GetNextTimepointDeparture-$Now).Minutes.ToString() + " mins"
If ($GetNextTimepointDeparture -eq $null) {
#echo "Next time of Departure (UTC): "$GetNextTimepointDepartures 
#echo "Time Currently is (UTC): " $Now 
echo "The last bus of the day has left" } else {
#echo "Next time of Departure (UTC): "$GetNextTimepointDepartures 
#echo "Time Currently is (UTC): " $Now 
echo $TimeToDeparture }
