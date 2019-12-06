[int]$global:posA = 0
[int]$global:posB = 3

Function ReadIntCode {
	[string]$string += get-content -path .\day2input.txt
	[array]$global:intCodeArray = $string.split(',')
	$buffer += $global:intCodeArray[$global:posA..$global:posB]
	if($buffer[$global:posA] -eq 1){
		OpCode1
		#return($buffer)
	}
	elseif($buffer[$global:posA] -eq 2){
		OpCode2
		#return($buffer)
	}
	elseif($buffer[$global:posA] -eq 99){
		OpCode99
		#return($buffer)
	}
	elseif($buffer[$global:posA] -notcontains @(1,2,99)){
		write-host "Fault. Unexpected OpCode."
	}
}


Function OpCode1() {
	write-host "OpCode1"
	$writePos = $buffer[3]
	[int]$val = $global:intCodeArray[$buffer[1]] 
	$global:intCodeArray[$writePos] += $val + $global:intCodeArray[$buffer[2]]
	$global:intCodeArray[$writePos]
	
}

Function OpCode2($buffer) {
	write-host "OpCode2"
}

Function OpCode99($buffer) {
	write-host "OpCode99"
}
ReadIntCode