#Install module for convert ps1 to exe
Install-Module ps2exe -Repository PSGallery
#Check module after installing
Get-Module -ListAvailable | where Name -EQ ps2exe

