echo "Welcome to Shiva."
$shiva = Import-Csv -Path ".\shiva.csv"
$pcodes = Import-Csv -Path ".\pcodes.csv"
$uwpunchtape = Import-Csv -Path ".\uwpunchtape.csv"
$today = Get-Date -Hour 0 -UFormat "%m/%d/%Y"
$daycounter = 0

# Base Dates for periodicities
$obasedate = Get-Date -Day 5 -Month 01 -Hour 00 -Year 2020
$altbasedate = Get-Date -Day 12 -Month 01 -Hour 00 -Year 2020
$fiscalyearstart = Get-Date -Month 10 -Day 01

while($true){
$otherdate = ([datetime]"$today").addDays("$daycounter")
#$firsttomonth = Get-Date $otherdate -Day 1 -Hour 0
#$lastomonth = Get-Date $firsttomonth.AddMonths(1).AddDays(-1)
$dow =([datetime]"$otherdate").ToString("dddd")
$datedisplay = $otherdate.ToString("dddd, MMM dd yyyy")
$odateday = [int]$otherdate.ToString("dd")

# Build alternating periodicities
## Every other (day of week)
$timefrombase = New-Timespan -Start $obasedate -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$omon = "true"}
$timefrombase = New-Timespan -Start $obasedate.AddDays(1) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$otues = "true"}
$timefrombase = New-Timespan -Start $obasedate.AddDays(2) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$owed = "true"}
$timefrombase = New-Timespan -Start $obasedate.AddDays(3) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$othurs = "true"}
$timefrombase = New-Timespan -Start $obasedate.AddDays(4) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$ofri = "true"}
$timefrombase = New-Timespan -Start $obasedate.AddDays(5) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$osat = "true"}
$timefrombase = New-Timespan -Start $obasedate.AddDays(6) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$osun = "true"}
## Every other (day of week) alternate
$timefrombase = New-Timespan -Start $altbasedate -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$altmon = "true"}
$timefrombase = New-Timespan -Start $altbasedate.AddDays(1) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$alttues = "true"}
$timefrombase = New-Timespan -Start $altbasedate.AddDays(2) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$altwed = "true"}
$timefrombase = New-Timespan -Start $altbasedate.AddDays(3) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$altthurs = "true"}
$timefrombase = New-Timespan -Start $altbasedate.AddDays(4) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$altfri = "true"}
$timefrombase = New-Timespan -Start $altbasedate.AddDays(5) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$altsat = "true"}
$timefrombase = New-Timespan -Start $altbasedate.AddDays(6) -End $otherdate
if ($timefrombase.Days % 14 -eq 0) {$altsun = "true"}

# Build periodicities within month
if ($odateday -le 7 -and $datedisplay -match "Monday") {$firstmon = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Monday") {$secondmon = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Monday") {$thirdmon = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Monday") {$fourthmon = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Monday") {$lastmon = "true"}

if ($odateday -le 7 -and $datedisplay -match "Tuesday") {$firsttues = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Tuesday") {$secondtues = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Tuesday") {$thirdtues = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Tuesday") {$fourthtues = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Tuesday") {$lasttues = "true"}

if ($odateday -le 7 -and $datedisplay -match "Wednesday") {$firstwed = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Wednesday") {$secondwed = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Wednesday") {$thirdwed = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Wednesday") {$fourthwed = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Wednesday") {$lastwed = "true"}

if ($odateday -le 7 -and $datedisplay -match "Thursday") {$firstthurs = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Thursday") {$secondthurs = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Thursday") {$thirdthurs = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Thursday") {$fourththurs = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Thursday") {$lastthurs = "true"}

if ($odateday -le 7 -and $datedisplay -match "Friday") {$firstfri = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Friday") {$secondfri = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Friday") {$thirdfri = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Friday") {$fourthfri = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Friday") {$lastfri = "true"}

if ($odateday -le 7 -and $datedisplay -match "Saturday") {$firstsat = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Saturday") {$secondsat = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Saturday") {$thirdsat = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Saturday") {$fourthsat = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Saturday") {$lastsat = "true"}

if ($odateday -le 7 -and $datedisplay -match "Sunday") {$firstsun = "true"}
if ($odateday -ge 8 -and $odateday -le 14 -and $datedisplay -match "Sunday") {$secondsun = "true"}
if ($odateday -ge 15 -and $odateday -le 21 -and $datedisplay -match "Sunday") {$thirdsun = "true"}
if ($odateday -ge 22 -and $odateday -le 28 -and $datedisplay -match "Sunday") {$fourthsun = "true"}
if ($odateday -ge 29 -and $odateday -le 31 -and $datedisplay -match "Sunday") {$lastsun = "true"}

echo "$datedisplay"
# Test if we are underway
$uw = $uwpunchtape | select -ExpandProperty 0
if ($uw = 1) { echo "**Underway**"}
else { echo "**In Port**" }

# Generate Periodicities
switch -regex ($datedisplay) {
    "Monday" { $pstring="1" }
    "Tuesday" { $pstring="2" }
    "Wednesday" { $pstring="3" }
    "Thursday" { $pstring="4" }
    "Friday" { $pstring="5" }
    "Saturday" { $pstring="6" }
    "Sunday" { $pstring="7" }
    {$firstmon -eq "true"} { $pstring+="A" }
    {$secondmon -eq "true"} { $pstring+="B" }
    {$thirdmon -eq "true"} { $pstring+="C" }
    {$fourthmon -eq "true"} { $pstring+="D" }
    {$firsttues -eq "true"} { $pstring+="E" }
    {$secondtues -eq "true"} { $pstring+="F" }
    {$thirdtues -eq "true"} { $pstring+="G" }
    {$fourthtues -eq "true"} { $pstring+="H" }
    {$firstwed -eq "true"} { $pstring+="I" }
    {$secondwed -eq "true"} { $pstring+="J" }
    {$thirdwed -eq "true"} { $pstring+="K" }
    {$fourthwed -eq "true"} { $pstring+="L" }
    {$firstthurs -eq "true"} { $pstring+="M" }
    {$secondthurs -eq "true"} { $pstring+="N" }
    {$thirdthurs -eq "true"} { $pstring+="O" }
    {$fourththurs -eq "true"} { $pstring+="P" }
    {$firstfri -eq "true"} { $pstring+="Q" }
    {$secondfri -eq "true"} { $pstring+="R" }
    {$thirdfri -eq "true"} { $pstring+="S" }
    {$fourthfri -eq "true"} { $pstring+="T" }
    {$firstsat -eq "true"} { $pstring+="U" }
    {$secondsat -eq "true"} { $pstring+="V" }
    {$thirdsat -eq "true"} { $pstring+="W" }
    {$fourthsat -eq "true"} { $pstring+="X" }
    {$firstsun -eq "true"} { $pstring+="Y" }
    {$secondsun -eq "true"} { $pstring+="Z" }
    {$thirdsun -eq "true"} { $pstring+="a" }
    {$fourthsun -eq "true"} { $pstring+="b" }
    {$omon -eq "true"} { $pstring+="c" }
    {$otues -eq "true"} { $pstring+="d" }
    {$owed -eq "true"} { $pstring+="e" }
    {$othurs -eq "true"} { $pstring+="f" }
    {$ofri -eq "true"} { $pstring+="g" }
    {$osat -eq "true"} { $pstring+="h" }
    {$osun -eq "true"} { $pstring+="i" }
    {$altmon -eq "true"} { $pstring+="j" }
    {$alttues -eq "true"} { $pstring+="k" }
    {$altwed -eq "true"} { $pstring+="l" }
    {$altthurs -eq "true" } { $pstring+="m" }
    {$altfri -eq "true"} { $pstring+="n" }
    {$altsat -eq "true"} { $pstring+="o" }
    {$altsun -eq "true"} { $pstring+="p" }
    default { "Error. No events matching specified date."}
}

# Apply Query for each Pcode, save to array
$daymerge=@() 
 foreach ($code in $pstring.ToCharArray()) {
    $daymerge += $shiva | Where-Object {($_.Periodicity -clike "*$code*")}  |  Where-Object {($_.UW -eq "$uw") -or ($_.UW -eq "$null")} | Write-Output
 }
$daymerge | Sort-Object -Property TimeStart | Format-Table -Property Serial, Periodicity, TimeStart, TimeEnd, Name, Location, CO -AutoSize
Clear-Variable -Name "daymerge" -Scope Global
Clear-Variable -Name "pstring" -Scope Global
Clear-Variable -Name "*mon" -Scope Global
Clear-Variable -Name "*tues" -Scope Global
Clear-Variable -Name "*wed" -Scope Global
Clear-Variable -Name "*thurs" -Scope Global
Clear-Variable -Name "*fri" -Scope Global
Clear-Variable -Name "*sat" -Scope Global
Clear-Variable -Name "*sun" -Scope Global
Clear-Variable -Name "timefrombase" -Scope Global

$inp = Read-Host -Prompt "Press ENTER to see the next day"
$daycounter++
}

