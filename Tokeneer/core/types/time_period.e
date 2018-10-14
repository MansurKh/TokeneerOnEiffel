note
	description: "{TIME_PERIOD}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "10"
	Section: "2.6.1"

class
	TIME_PERIOD

create
	make, set_as

feature

	make (start_date_: DATE; end_date_: DATE; start_time_: TIME; end_time_: TIME)
		do
			start_date := start_date_
			end_date := end_date_
			start_time := start_time_
			end_time := end_time_
		ensure
			start_date = start_date_
			end_date = end_date_
			start_time = start_time_
			end_time = end_time_
		end

		feature

	set_as (time_period: like Current)
		do
			start_date := time_period.start_date.twin
			end_date := time_period.end_date.twin
			start_time := time_period.start_time.twin
			end_time := time_period.end_time.twin
		ensure
			start_date = time_period.start_date
			end_date = time_period.end_date
			start_time = time_period.start_time
			end_time = time_period.end_time
		end


feature

	is_within_validity_period (now: DATE_TIME): BOOLEAN
		do
			Result := now.date >= start_date and now.date <= end_date and now.time >= start_time and now.time <= end_time
		ensure
			Result = (now.date >= start_date and now.date <= end_date and now.time >= start_time and now.time <= end_time)
		end

feature -- Access

	start_date: DATE

	end_date: DATE

	start_time: TIME

	end_time: TIME

invariant
	valid_time_bounds: start_time <= end_time
	valid_date_bounds: start_date <= end_date
end
