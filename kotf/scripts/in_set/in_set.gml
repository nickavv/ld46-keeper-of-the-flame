// Determine if the current value of a variable is within a certain set of values
// Returns true if the value of argument0 matches any value in argument1
/// @param string
/// @param set
var currentValue = argument0;
var checkValues = argument1;
for(var i = 0; i < array_length_1d(checkValues); i++) {
	if (currentValue == checkValues[i]) {
		return true;
	}
}
return false;