#Uninstall rentalresult v 10 Train and UAT build 11-2017 (VMware ThinApp)
start-process msiexec.exe -ArgumentList "/x {D7B13674-9D1B-4A18-A14D-118F3E75C8B8} /q /norestart" -wait
#Uninstall rentalresult v10 IS x64 build 03-2018 (VMware ThinApp)
start-process msiexec.exe -ArgumentList "/x {9FA59457-E7B2-49B8-AA15-6E60DE44C61C} /q /norestart" -wait
#Uninstall rentalresult v10 IS x64 build 8-2013 (VMware ThinApp)
start-process msiexec.exe -ArgumentList "/x {63387F31-DDBC-45F4-A8E0-5E7C66E894D0} /q /norestart" -wait
#Uninstall rentalresult v10 Live x64 build 03-2018 (VMware ThinApp)
start-process msiexec.exe -ArgumentList "/x {BCDE9037-5F07-4B25-8573-4651411FC34C} /q /norestart" -wait
#Uninstall rentalresult v10 Live x64 build 12-2017 (VMware ThinApp)
start-process msiexec.exe -ArgumentList "/x {E3B388A2-D53B-4C6C-8AFF-E55073883AFF} /q /norestart" -wait
#Uninstall RentalResult v10 Live x64 build 6-2016 (VMware ThinApp)
start-process msiexec.exe -ArgumentList "/x {EDB00401-2E6D-407E-9316-14757111A9E8} /q /norestart" -wait

#Install rentalresult v10 Live build 1904
msiexec.exe /i "$PSScriptRoot\rentalresult v10 Live build 1904.msi" /q /norestart