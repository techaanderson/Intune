##### Install Microsoft Visual C++ Redistributables ####
# Force use of TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Create working folder if not there
$path = "C:\Setup\VcRedist"
If (!(test-path $path)) {
      New-Item -ItemType Directory -Force -Path $path
}

#Install Microsoft Visual C++ Redistributable - Visual Studio 2015, 2017, 2019, and 2022
    $2015path = "C:\Setup\VcRedist\VS2015+"
    If (!(test-path $2015path)) {
          New-Item -ItemType Directory -Force -Path $2015path
    }
    # x64
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://aka.ms/vs/17/release/vc_redist.x64.exe -OutFile $2015path\vc_redist.x64.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2015path\vc_redist.x64.exe -ArgumentList '/q /norestart' -Wait

    # x86
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://aka.ms/vs/17/release/vc_redist.x86.exe -OutFile $2015path\vc_redist.x86.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2015path\vc_redist.x86.exe -ArgumentList '/q /norestart' -Wait

#Install Microsoft Visual C++ Redistributable - Visual Studio 2013
    $2013path = "C:\Setup\VcRedist\VS2013"
    If (!(test-path $2013path)) {
      New-Item -ItemType Directory -Force -Path $2013path
    }
    # x64
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://aka.ms/highdpimfc2013x64enu -OutFile $2013path\vc_redist.x64.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2013path\vc_redist.x64.exe -ArgumentList '/q /norestart' -Wait

    # x86
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://aka.ms/highdpimfc2013x86enu -OutFile $2013path\vc_redist.x86.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2013path\vc_redist.x86.exe -ArgumentList '/q /norestart' -Wait

#Install Microsoft Visual C++ Redistributable - Visual Studio 2012
    $2012path = "C:\Setup\VcRedist\VS2012"
    If (!(test-path $2012path)) {
    New-Item -ItemType Directory -Force -Path $2012path
    }
    # x64
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe -OutFile $2012path\vc_redist.x64.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2012path\vc_redist.x64.exe -ArgumentList '/q /norestart' -Wait

    # x86
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe -OutFile $2012path\vc_redist.x86.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2012path\vc_redist.x86.exe -ArgumentList '/q /norestart' -Wait

#Install Microsoft Visual C++ Redistributable - Visual Studio 2010
    $2010path = "C:\Setup\VcRedist\VS2010"
    If (!(test-path $2010path)) {
    New-Item -ItemType Directory -Force -Path $2010path
    }
    # x64
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://download.microsoft.com/download/A/8/0/A80747C3-41BD-45DF-B505-E9710D2744E0/vcredist_x64.exe -OutFile $2010path\vc_redist.x64.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2010path\vc_redist.x64.exe -ArgumentList '/q /norestart' -Wait

    # x86
    # Invoke-WebRequest -Uri $url -OutFile $netEXE -UseBasicParsing
    Invoke-WebRequest -Uri https://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe -OutFile $2010path\vc_redist.x86.exe -UseBasicParsing
    # Run .exe just downloaded
    Start-Process -FilePath $2010path\vc_redist.x86.exe -ArgumentList '/q /norestart' -Wait