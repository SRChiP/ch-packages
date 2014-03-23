

$packageName = 'xdelta3' 
$url = 'https://xdelta.googlecode.com/files/xdelta3-3.0.8.x86-32.exe' 
$url64 = 'https://xdelta.googlecode.com/files/xdelta3-3.0.8.x86-64.exe'

try { 
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  
  if (![System.IO.Directory]::Exists($installDir)) {[System.IO.Directory]::CreateDirectory($installDir)}

  $file = Join-Path $installDir "$($packageName).exe"
   
  Get-ChocolateyWebFile "$packageName" "$file" "$url" "$url64"
  ###Get-ChocolateyBins $installDir

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}