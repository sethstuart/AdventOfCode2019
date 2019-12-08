[int]$global:posA = 0
[int]$global:posB = 3
[bool]$global:loop = $true
while($global:loop -eq $true) {
	Function BuildArray {
		[string]$string += get-content -path .\day2input.txt
		[array]$global:intCodeArray = $string.split(',')
		ReadIntCode
	}
	Function ReadIntCode {
		[array]$codes = @(1,2,99)
		[array]$global:buffer = @()
		$global:buffer += $global:intCodeArray[$global:posA..$global:posB]
		if($global:buffer[0] -eq 1){
			OpCode1
		}
		elseif($global:buffer[0] -eq 2){
			OpCode2
		}
		elseif($global:buffer[0] -eq 99){
			OpCode99
		}
		elseif($global:buffer[$global:posA] -notcontains $codes){ 
			$global:buffer
			OpCode99
		}
	}
	Function Step {
		$global:posA = $global:posA + 4
		$global:posB = $global:posB + 4
		ReadIntCode
	}
	Function OpCode1() {
		[int]$writePos = $global:buffer[3]
		[int]$valA = $global:intCodeArray[$global:buffer[1]]
		[int]$valB = $global:intCodeArray[$global:buffer[2]]
		$global:intCodeArray[$writePos] = $valA + $valB
		Step
	}
	Function OpCode2() {
		[int]$writePos = $global:buffer[3]
		[int]$valA = $global:intCodeArray[$global:buffer[1]]
		[int]$valB = $global:intCodeArray[$global:buffer[2]]
		$global:intCodeArray[$writePos] = $valA * $valB
		Step
	}
	Function OpCode99() {
		$global:loop = $false
		$global:intCodeArray[0]
	}
	BuildArray
}