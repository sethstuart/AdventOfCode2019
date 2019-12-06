$global:Index = 0

Function TextToPSList {
    $global:fuelReq = ,@()
    $global:fuelReq[0] += get-content -path .\day1input.txt
}

Function ArrayController {
	$global:fuelReq += ,@() #needs to be logic controlled
	foreach($mass in $global:fuelReq[$global:Index]) { #need to functionize
	    $m = ($mass / 3) - 2
		$m = [math]::floor($m)
		$global:fuelReq[$global:Index + 1] += $m
	}
	$global:Index = $global:Index + 1
}

TextToPSList
ArrayController
$global:fuelReq[$global:Index]
write-host "The thing worked!!"

ArrayController
$global:fuelReq[$global:Index]
write-host "The thing worked twice!!"

ArrayController
$global:fuelReq[$global:Index]
write-host "The thing worked thrice!!"


# SCRATCHPAD:

    # $fuelReq[0]
	# write-host "###########################################"
	# $fuelReq[1]
	# $totalReq = 0
	# foreach($req in $fuelReq) {
	# $totalReq = $totalReq + $req
	# }
	# $totalReq
	
##########################################################################################
	
#All current code inline for testing:
# $global:Index = 0

# $global:fuelReq = ,@()
# $global:fuelReq[0] += get-content -path .\day1input.txt

# $global:fuelReq += ,@() #needs to be logic controlled
# foreach($mass in $global:fuelReq[$global:Index]) { #need to functionize
	# $m = ($mass / 3) - 2
    # $m = [math]::floor($m)
    # $global:fuelReq[$global:Index + 1] += $m
# }
# $global:Index = $global:Index + 1

# $global:fuelReq[$global:Index]
