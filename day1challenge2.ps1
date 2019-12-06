$global:Index = 0


Function TextToPSList {
    $global:fuelReq = ,@()
	$global:fuelReq[$global:Index] += get-content -path .\testinput.txt
	StepCheck
}

#Next Steps: 
# The checker also needs to see if all results in the next round will create values <= 0, and if so terminate the loop and tabulate values
# Make a function that adds up all results from fuelReq[1] to fuelReq[n] into totalReq

Function ArrayController {
	foreach($mass in $global:fuelReq[$global:Index]) {
	    $m = ($mass / 3) - 2
		$m = [math]::floor($m)
		if($m -le 0) {
			$global:fuelReq[$global:Index + 1] += 0
		}
		else {
			$global:fuelReq[$global:Index + 1] += $m
		}
		$global:Index = $global:Index + 1
		StepCheck
	}
}

Function StepCheck {
	$rowTotalReq = 0
	foreach($mass in $global:fuelReq[$global:Index]) {
		$rowTotalReq = $rowTotalReq + $mass
	}
		if($rowTotalReq -gt 0) {
			$global:fuelReq += ,@()
			write-host "Step Check $global:Index complete"
			ArrayController
		}

		elseif($rowTotalReq -eq 0) {
			write-host $global:Index
			write-host "####################"
			Calculate
		}
}

Function Calculate {
	$total = @()
	$counter = 1
	while($counter -eq 1){
		if($global:Index -gt 0) {
			$rowTotalReq = 0
			foreach($mass in $global:fuelReq[$global:Index]) {
				$rowTotalReq = $rowTotalReq + $mass
			}
			$total += $rowTotalReq
			$global:Index = $global:Index - 1
		}
		elseif($global:Index -eq 0) {
			$counter = 0
			foreach($num in $total) {
				[int]$grandTotal = $grandTotal + $num
			}
			write-host "The final total is $grandTotal"
		}
	}
}

TextToPSList