var allOpen = true;
for (var i = 0; i < array_length_1d(switches); i++) {
	if (switches[i].thrown == false) {
		allOpen = false;
	}
}
if (allOpen == true) {
	event_user(0);
}