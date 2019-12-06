$global:Index = 0

Function TextToPSList {
    $global:fuelReq = ,@()
    $global:fuelReq[0] += get-content -path .\day1input.txt
}

#Next Steps: 
# Make a checker fucntion to go between TexttoPSList and ArrayController. This will manage the creation of new rows in the matrix, iterating Index, and breaking the loop
# The checker should look to see if the next round will create values <= 0, and if so insert 0 into the matrix
# The checker also needs to see if all results in the next round will create values <= 0, and if so terminate the loop and tabulate values

# Make a function that adds up all results from fuelReq[1] to fuelReq[n] into totalReq

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
