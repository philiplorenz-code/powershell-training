# Grundlage hierfür sind booleans!


# Conditions sind Bedingungen, die deinem Code ermöglichen "Entscheidungen" zu treffen
# Der Code in den runden Klammern muss als Ergebnis immer $true oder $false erzeugen!!
# Wenn der Code aus den runden Klammern $true zurückgibt, wird der Code aus der geschweiften Klammer ausgeführt, andernfalls nicht!


$var = 3
if ($var -gt 3) {
    Write-Host "Die Variable ist groesser als 3!!"
}
# Wenn die Condition (runde Klammer) aus IF $false zurückgibt, wird die Condition aus ELSEIF geprüft
elseif ($var -eq 3) {
    Write-Host "Die Variable ist gleich 3!!"
}
# Wenn die oberen Conditions allesamt nicht ausgeführt werden, wird ELSE ausgeführt (ELSE mit Bedacht wählen, da es ja passieren kann, dass man vergisst einen Fall in den oberen Conditions abzudecken und in diesem Fall der Code aus ELSE garnicht ausgeführt werden soll)
else {
    Write-Host "Die Variable ist kleiner als 3!!"
}





# Weitere Vergleichsoperatoren:

# Zahlen
# -eq equals        gleich
# -le lower equal   kleiner gleich
# -ge greater equal größer gleich
# -lt lower than    kleiner als
# -gt greater than  größer als

# Text
# -eq   equals        gleich
# -like wie -> zum Beispiel ("Test" -like "*est") -> $true


# Switch

$day = 3
if ( $day -eq 0 ) { $result = 'Sunday'        }
elseif ( $day -eq 1 ) { $result = 'Monday'    }
elseif ( $day -eq 2 ) { $result = 'Tuesday'   }
elseif ( $day -eq 3 ) { $result = 'Wednesday' }
elseif ( $day -eq 4 ) { $result = 'Thursday'  }
elseif ( $day -eq 5 ) { $result = 'Friday'    }
elseif ( $day -eq 6 ) { $result = 'Saturday'  }
$result


$day = 3
switch ( $day )
{
    0 { $result = 'Sunday'    }
    1 { $result = 'Monday'    }
    2 { $result = 'Tuesday'   }
    3 { $result = 'Wednesday' }
    4 { $result = 'Thursday'  }
    5 { $result = 'Friday'    }
    6 { $result = 'Saturday'  }
}
$result