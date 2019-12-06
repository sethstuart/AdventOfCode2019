$global:Index = 0 #A global variable is defined to use as the increment for the index of the arrays


Function TextToPSList {
	$global:fuelReq = ,@() # A new global multidimensional array is made. Fuel Requirement.
	$global:fuelReq[$global:Index] += get-content -path .\day1input.txt #Using get-content, the specified file is parsed and lines are sent to Row 0
	StepCheck # StepCheck is called.
}

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
	}
	$global:Index = $global:Index + 1
	StepCheck
}

Function StepCheck {
	[int]$global:rowTotalReq = 0
	foreach($mass in $global:fuelReq[$global:Index]) { # for each value in current row:
		$global:rowTotalReq = $global:rowTotalReq + $mass #Add up the entire row
	}
		if($global:rowTotalReq -gt 0) {
			$global:fuelReq += ,@()
			write-host "Step Check $global:Index complete. Row Total is $global:rowTotalReq"
			ArrayController
		}

		elseif($global:rowTotalReq -eq 0) {
			Calculate
		}
}

Function Calculate {
	$total = @()
	$counter = 1
	while($counter -eq 1){
		if($global:Index -gt 0) {
			[int]$TotalReq = 0
			foreach($mass in $global:fuelReq[$global:Index]) {
				$TotalReq = $TotalReq + $mass
			}
			$total += $TotalReq
			$global:Index = $global:Index - 1
		}
		elseif($global:Index -eq 0) {
			foreach($num in $total) {
				[int]$grandTotal = $grandTotal + $num
			}
			write-host "The final total is $grandTotal"
			$counter = 0
		}
	}
}

TextToPSList