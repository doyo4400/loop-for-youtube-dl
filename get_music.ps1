$myDirectory = [System.IO.Path]::GetDirectoryName($myInvocation.MyCommand.Definition)


$outputdir =  $($Mydirectory + "/musics")
$url       = 'http://your_server/'

New-Item -ItemType "directory" -Path $outputdir


$WebResponse = Invoke-WebRequest -Uri $url
# get the list of links, skip the first one ("../") and download the files
$WebResponse.Links | Select-Object -ExpandProperty href -Skip 1 | ForEach-Object {
    Write-Host "Downloading file '$_'"
    $filePath = Join-Path -Path $outputdir -ChildPath $_
    $fileUrl  = '{0}/{1}' -f $url.TrimEnd('/'), $_
    Invoke-WebRequest -Uri $fileUrl -OutFile $filePath
    }
    

# Convert title from hex to car
$Name = -join (180..190|%{[char]$_})
New-Item -ItemType File -Name $Name

Get-ChildItem -Path $outputdir -Filter *.mp3 | Rename-Item -NewName { 
    [regex]::Replace(
        $_.Name, 
        '[\xB4-\xBE]',
        '_'
    )
} -WhatIf
