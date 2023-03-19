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
