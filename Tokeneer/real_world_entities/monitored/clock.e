note
	description: "{CLOCK} is the system clock. There is an assumption the system time never goes back"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "8"
	Section: "2.4"
	Z_schema: "Time"

class
	CLOCK

create
	make

feature

	make
		do
			create recent_time.make_now
		end

feature -- Access

	now: DATE_TIME
			-- Returns the current time, and updates `recent_time'
		do
			create Result.make_now
			recent_time := Result
		ensure
			time_passes: Result >= old recent_time
				-- System time should not go back. Assumption comes from Z-scheme "RealWorldChanges"
			recently_updated: Result = recent_time
		end

feature -- Queries

	recent_time: DATE_TIME
			-- Get the timestamp that was returned when calling `now' recently

	time_after (seconds: INTEGER): DATE_TIME
		require
			seconds_non_negative: seconds >= 0
		do
			create Result.make_by_date_time (recent_time.date, recent_time.time)
			Result.second_add (seconds)
		end

	formatted_date: STRING
		do
			Result := recent_time.formatted_out ("YYYY-MMM-DD")
		ensure
			recent_time = old recent_time
		end

	formatted_time: STRING
		do
			Result := recent_time.formatted_out ("[0]HH:[0]mi:[0]ss")
		ensure
			recent_time = old recent_time
		end

	formatted_date_time: STRING
		do
			Result := formatted_date + " " + formatted_time
		ensure
			recent_time = old recent_time
		end

invariant
	time_goes_only_forward: now >= recent_time

end
