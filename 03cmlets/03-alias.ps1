Get-ChildItem
gci
dir
ls

# Alle Alias
Get-Alias

# CMDlet zu einem Alias finden:
Get-Alias gci

# Alias zu einem CMDlet finden
Get-Alias -Definition Get-ChildItem

# Neuen Alias anlegen
New-Alias -Name proc -Value Get-Process

# VORSICHT:
# EIGENE ALIASE SIND NICHT ZWINGEND AUF ANDEREN SYSTEMEN VORHANDEN -> FEHLERANFÄLLIG
# NICHT JEDER IST MIT ALIAS VERTRAUT - DIESE SIND OFTMALS WENIG AUSSAGEKRÄFTIG
# GRUNDSATZ - ALIASE SIND
  # GUT FÜR ARBEITEN IN DER SHELL
  # SCHLECHT FÜR SCRIPTE