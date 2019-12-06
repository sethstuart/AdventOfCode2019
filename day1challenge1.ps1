Function TextToPSList {
    $list = get-content -path .\day1input.txt
	$fuelReq = @()
	$totalReq = 0
	foreach($mass in $list) {
		$totalReq += ([math]::floor($mass/3)-2)
	}
	$totalReq
}
TextToPSList