# APIC 
API Consumption Code Test<br>

This powershell script uses the API from http://svc.metrotransit.org to determine the next bus leaving from a particular stop.<br>


Once downloaded, this script can be run from the command line by calling the file directly and inputing in order:
  1. The full Route details
  2. The full Stop details
  3. The direction of the Route requested<br>
  
Response will be minutes to the next bus at that stop or a comment if the last bus for the day has left.
<br>  
 # Examples:
    > & '.APIC.ps1' "METRO Blue Line" "Target Field Station Platform 1" "south"
     
    > & '.\APIC.ps1' "Express - Target - Hwy 252 and 73rd Av P&R - Mpls" "Target North Campus Building F" "South"
     
 
