tell application "Calendar"
	set totalMinutes to 0
	tell calendar "Appointments"
		set theEventList to every event whose (summary contains "Artichoke rehearsal" or summary contains "Artichoke tech") and start date is greater than or equal to date "12/15/12"
		repeat with myEvent in theEventList
			set minutes to (((end date of myEvent) - (start date of myEvent)) / 60) as integer
			set totalMinutes to totalMinutes + minutes
		end repeat
	end tell
	set totalHours to totalMinutes div 60
	return totalHours
end tell
