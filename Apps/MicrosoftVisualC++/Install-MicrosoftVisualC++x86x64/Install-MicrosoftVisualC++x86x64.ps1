# Download Source Files from "https://docs.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2010-vc-100-sp1-no-longer-supported"

#Install C++ 2010 x86
Start-Process -FilePath "$psscriptroot\Source\VS2010\vcredist_x86.exe" -ArgumentList "/Q /norestart" -wait
#Install C++ 2010 x64
Start-Process -FilePath "$psscriptroot\Source\VS2010\vcredist_x64.exe" -ArgumentList "/Q /norestart" -wait

#Install C++ 2012 x86
Start-Process -FilePath "$psscriptroot\Source\VS2012\vcredist_x86.exe" -ArgumentList "/Q /norestart" -wait
#Install C++ 2012 x64
Start-Process -FilePath "$psscriptroot\Source\VS2012\vcredist_x64.exe" -ArgumentList "/Q /norestart" -wait

#Install C++ 2013 x86
Start-Process -FilePath "$psscriptroot\Source\VS2013\vcredist_x86.exe" -ArgumentList "/Q /norestart" -wait
#Install C++ 2013 x64
Start-Process -FilePath "$psscriptroot\Source\VS2013\vcredist_x64.exe" -ArgumentList "/Q /norestart" -wait

#Install C++ 2015-2022 x86
Start-Process -FilePath "$psscriptroot\Source\VS2019\VC_redist.x86.exe" -ArgumentList "/Q /norestart" -wait
#Install C++ 2015-2022 x64
Start-Process -FilePath "$psscriptroot\Source\VS2019\VC_redist.x64.exe" -ArgumentList "/Q /norestart" -wait