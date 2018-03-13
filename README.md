# APIC 
API Consumption Code Test

Once downloaded, this file can be run from the command line by calling the file directly and inputing in order:
  1. The full Route details
  2. The full Stop details
  3. The direction of the Route requested
  
Response will be minutes to the next bus at that stop or a comment if the last bus for the day has left.
  
 # Examples:
    > & '.APIC.ps1' "METRO Blue Line" "Target Field Station Platform 1" "south"
     
    > & '.\APIC.ps1' "Express - Target - Hwy 252 and 73rd Av P&R - Mpls" "Target North Campus Building F" "South"
     
 
