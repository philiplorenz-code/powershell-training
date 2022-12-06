# Windows PowerShell & PowerShell Core
## Windows PowerShell: Version 1-5
- Wird bereits mit Windows ausgeliefert, siehe Liste unten 
- Ist komplett abwärtskompatibel -> PowerShell Version 5 deckt alle Funktionen von PS-Version 2 ab
- Wird nicht mehr weitergetrieben seitens Microsoft
- Für manche Module aber notwendig! (zB AD)
- Von ISE unterstützt


## PowerShell Core: Version 6 & 7
- Schneller
- nicht von ISE unterstützt
- Cross-Plattform (Windows, Linux, MacOS)
- Open Source
- wird weiterentwickelt
- ACHTUNG: nicht alle CMDlets funktionieren (vorallem bei Modulen) -> hier muss getestet werden


### PS-Version abfragen:
$PSVersiontable

## Unterschiede Windows PowerShell:
PowerShell 5.x neue Features:
https://docs.microsoft.com/de-de/powershell/scripting/windows-powershell/whats-new/what-s-new-in-windows-powershell-50?view=powershell-7.2

https://4sysops.com/wiki/differences-between-powershell-versions/history/?revision=27473

## Unterschiede Windows PowerShell und PowerShell Core:
https://docs.microsoft.com/en-us/powershell/scripting/whats-new/differences-from-windows-powershell?view=powershell-7.2

### Windows PowerShell OS Vergleich
|||||
|--- |--- |--- |--- |
|PowerShell Version|Release Date|Default Windows Versions|Available Windows Versions|
|PowerShell 1.0|November 2006|Windows Server 2008 (*)|Windows XP SP2 Windows XP SP3 Windows Server 2003 SP1 Windows Server 2003 SP2 Windows Server 2003 R2 Windows Vista Windows Vista SP2|
|PowerShell 2.0|October 2009|Windows 7 Windows Server 2008 R2 (**)|Windows XP SP3 Windows Server 2003 SP2 Windows Vista SP1 Windows Vista SP2 Windows Server 2008 SP1 Windows Server 2008 SP2|
|PowerShell 3.0|September 2012|Windows 8 Windows Server 2012|Windows 7 SP1 Windows Server 2008 SP2 Windows Server 2008 R2 SP1|
|PowerShell 4.0|October 2013|Windows 8.1 Windows Server 2012 R2|Windows 7 SP1 Windows Server 2008 R2 SP1 Windows Server 2012|
|PowerShell 5.0|February 2016|Windows 10|Windows 7 SP1 Windows 8.1 Windows Server 2012 Windows Server 2012 R2|
|PowerShell 5.1|January 2017|Windows 10 Anniversary Update Windows Server 2016|Windows 7 SP1 Windows 8.1 Windows Server 2008 R2 SP1 Windows Server 2012 Windows Server 2012 R2|
|PowerShell Core 6|January 2018|N/A|Windows 7 SP1 Windows 8.1 Windows Server 2008 R2 SP1 Windows Server 2012 Windows Server 2012 R2|
|PowerShell 7|March 2020|N/A|Windows 7 SP1 Windows 8.1 Windows Server 2008 R2 SP1 Windows Server 2012 Windows Server 2012 R2|



### PSCore OS Vergleich
|OS|Windows PowerShell 5.1|PowerShell Core 6.0|PowerShell Core 6.1|PowerShell 7|
|--- |--- |--- |--- |--- |
|Windows|Windows 7 SP1Windows 8.1Windows 10Windows Server 2008 R2 SP1+Windows Server 2012Windows Server 2012 R2Windows Server 2016|Windows 7 SP1Windows 8.1Windows 10Windows Server 2008 R2 SP1+Windows Server 2012Windows Server 2012 R2Windows Server 2016|Windows 7 SP1Windows 8.1Windows 10 1607+Windows Server 2008 R2 SP1+Windows Server 2012Windows Server 2012 R2Windows Server 2016Windows Server 2019|Windows 7 SP1Windows 8.1Windows 10Windows Server 2008 R2 SP1+Windows Server 2012Windows Server 2012 R2Windows Server 2016Windows Server 2019|
|macOS|-|10.12+|10.12+|10.13+|
|Red Hat Enterprise Linux|-|7|7|7|
|CentOS|-|7|7|7|
|Oracle Linux|-|7|-|-|
|Fedora|-|25, 26|27, 28|29+|
|Debian|-|8.7+, 9|8.7+, 9|9+|
|Ubuntu|-|14.04, 16.04, 17.04 18, 17|18.10|16.04+|
|openSUSE|-|42.2+|42.2+|15+|
|Arch Linux|-|N/A|N/A|N/A|
|Kali|-|N/A|N/A|N/A|
|Raspbian|-|N/A|(ARM32)|N/A|
|Alpine|-|-|(experimental Docker image coming soon)|3.8+|