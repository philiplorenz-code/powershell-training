#WhatIf Parameter
New-Item "test" -ItemType Directory -WhatIf

#Verbose Parameter
Start-Process notepad
stop-process -name Notepad -verbose

#Debug Parameter
Start-Process notepad
stop-process -name Notepad -Debug

# Confirm Parameter
touch tmp1.txt
touch tmp2.txt
touch tmp3.txt
Remove-Item tmp*.txt -Confirm