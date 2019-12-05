Function TextToPSList {
    $list = get-content -path .\day1input.txt
	$fuelReq = @()
    #write-host "$list[0]"
	foreach($mass in $list) {
	    $m = ($mass / 3) - 2
		$m = [math]::floor($m)
		$fuelReq += $m
	}
	$totalReq = 0
	foreach($req in $fuelReq) {
	    $totalReq = $totalReq + $req
	}
	$totalReq
}

TextToPSList