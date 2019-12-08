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
		write-host "Next opcode is:" $global:buffer[0]
		if($global:buffer[0] -eq 1){
			OpCode1
			#return($global:buffer)
		}
		elseif($global:buffer[0] -eq 2){
			OpCode2
			#return($global:buffer)
		}
		elseif($global:buffer[0] -eq 99){
			OpCode99
			#return($global:buffer)
		}
		elseif($global:buffer[$global:posA] -notcontains $codes){
			write-host "Fault. Unexpected OpCode." 
			$global:buffer
			OpCode99
		}
	}


	Function Step {
		write-host "PosA and PosB pre-step:" $global:posA "," $global:posB
		$global:posA = $global:posA + 4
		$global:posB = $global:posB + 4
		write-host "PosA and PosB post-step:" $global:posA "," $global:posB
		ReadIntCode
	}

	Function OpCode1() {
		[int]$writePos = $global:buffer[3]
		write-host "--------"
		write-host "Buffer is:" $global:buffer
		write-host "--------"
		write-host "Write position is: $writePos"
		write-host "--------"
		[int]$valA = $global:intCodeArray[$global:buffer[1]]
		[int]$valB = $global:intCodeArray[$global:buffer[2]]
		write-host "The math looks like: $valA + $valB"
		$global:intCodeArray[$writePos] = $valA + $valB
		write-host "--------"
		write-host "OpCode1 Result:" $global:intCodeArray[$writePos]
		Step
	}

	Function OpCode2() {
		[int]$writePos = $global:buffer[3]
		write-host "--------"
		write-host "Buffer is: $global:buffer"
		write-host "--------"
		write-host "Write position is: $writePos"
		write-host "--------"
		[int]$valA = $global:intCodeArray[$global:buffer[1]]
		[int]$valB = $global:intCodeArray[$global:buffer[2]]
		write-host "The math looks like: $valA * $valB"
		write-host "--------"
		$global:intCodeArray[$writePos] = $valA * $valB
		write-host "--------"
		write-host "OpCode2 Result:" $global:intCodeArray[$writePos]
		Step
	}

	Function OpCode99() {
		$global:loop = $false
		$global:intCodeArray[0]
		# write-host "Final Array"
		# $global:intCodeArray
	}
	write-host "Building Array"
	BuildArray
}