function Get-FolderSize {
	param (
		$FolderName
	)
    $Result = [Math]::Round(
            ((Get-ChildItem $FolderName -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB)
    )

	Write-Output "$FolderName $Result MB"
}

foreach ($Folder in $(Get-ChildItem -Name -Directory)) {
    Get-FolderSize($Folder)
}
