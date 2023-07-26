$TimeZone = [System.TimeZoneInfo]::FindSystemTimeZoneById("China Standard Time")
$Tag = [System.TimeZoneInfo]::ConvertTime($(Get-Item assets/tmpthaifont).LastWriteTime, $TimeZone).ToString("yyMMdd")
echo "MY_TAG=$Tag" | Out-File -FilePath $env:GITHUB_ENV -Append
$Path = "Release"
New-Item -Name "$Path" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "Mods" -ItemType "directory" -Force
Copy-Item -Path assets/tmpthaifont -Destination $Path/Mods -Force
7z a -t7z "$Path/tmpthaifont_$Tag.7z" "./$Path/*" -mx=9 -ms