# Strings = einfache Folge von Zeichenketten, erkennbar an Anführungszeichen
"Ich bin ein String"
'Ich bin ein String'

$string1 = "Ich bin ein String"
$string2 = 'Ich bin ein String'

$string1.GetType()

$zahlstring = "5"

$string1.Replace("String", "Strong")
$string1 -replace "String", "Strong"
# -> Hat keine Auswirkung auf die Variable selbst!!
$string1

$string1++
$string3 = $string1 + $string2
$string3


#############################################################

# Zahlenwerte (Ganzzahlen)

5

"5" # -> ist ein String wegen der "

5 + 5
"5" + "5"

5 * 5
10 / 5
10 - 5
10 + 5

# Achtung: 5.5 ist kein Interger, sondern ein Double (wegen dem Komma)


#############################################################

# Wahrheitswerte werden als Boolean bezeichnet

$true #1
$false

$true + $true

# "Conditions" haben als Ergebnis immer ein Boolean
5 -gt 7
"Test" -eq "Test1"


# Vergleichoperatoren
# Zahlen
# -eq equals        gleich
# -le lower equal   kleiner gleich
# -ge greater equal größer gleich
# -lt lower than    kleiner als
# -gt greater than  größer als

# Text
# -eq   equals        gleich
# -like wie -> zum Beispiel ("Test" -like "*est") -> $true


#############################################################

# eine Uhrzeit, ist weder String noch Integer, sondern ein eigenständiger Datentyp!

$date = Get-Date

$date.AddHours(-5)

$TimeStamp = Get-Date 
$TimeStampString = $TimeStamp.ToString("dd/MM/yyyy hh:mm:ss")
$TimeStampString = $TimeStamp.ToString("dd/MM/yyyy HH:mm:ss")

#############################################################

# Arrays
$data = @()
$data += 4
$data += 7
$data += 5

$data = @(
  4,
  7,
  5
)

$data = 4, 7, 5


$data[0]
$data[1]
$data[-1]

$data[0..1]

$data[0] = 1



$data = @('red', 'green', 'blue')
$data -contains 'green'



# Hashtables
# Leeren Hashtable erzeugen
$HashTable = @{}

# Werte hinzufügen
$HashTable.Add("GoogleDNS", "8.8.8.8")
$HashTable += @{"localhost" = "127.0.0.1" }

# Werte abfragen
$HashTable.localhost
$HashTable[0] # Geht nicht, da KEINE Indizierung!

# Keys und Vals
$HashTable.Keys

# Hashtable Params
$params = @{
  "ComputerName" = $HashTable.GoogleDNS
  "Count"        = 2
  "Quiet"        = $true
}

Test-Connection -ComputerName $HashTable.GoogleDNS -Count 2 -Quiet
Test-Connection @params

