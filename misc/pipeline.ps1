# Ohne Pipeline
$content = Get-Content "C:\logs\error.log"
Out-File -InputObject $content -FilePath "C:\backup\error_backup.log"

# Mit Pipeline
Get-Content "C:\logs\error.log" | Out-File "C:\backup\error_backup.log"



# Funktion 1: Generiert Zahlen von 1 bis 5
function Get-Numbers {
  1..5
}

# Funktion 2: Quadrat der empfangenen Zahlen
function Get-Squares {
  [CmdletBinding()]
  param(
      [Parameter(ValueFromPipeline=$true)]
      [int]$Number
  )

  process {
      $Number * $Number
  }
}

# Funktion 3: Überprüft, ob eine Zahl gerade ist
function Test-IsEven {
  [CmdletBinding()]
  param(
      [Parameter(ValueFromPipeline=$true)]
      [int]$Number
  )

  process {
      if ($Number % 2 -eq 0) {
          $Number
      }
  }
}

# Verwenden der Pipeline
Get-Numbers | Get-Squares | Test-IsEven


# Begin, Process, End
function Get-TotalValue {
  param(
      [Parameter(ValueFromPipeline=$true)]
      [int]$Number
  )

  begin {
      $total = 0
  }

  process {
      $total += $Number
  }

  end {
      "The total sum is: $total"
  }
}

1..5 | Get-TotalValue  # Gibt "The total sum is: 15" zurück