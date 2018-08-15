note
	description: "Summary description for {TIME_PERIOD}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "10"
	Section: "2.6.1"

class
	TIME_PERIOD

create
	make

feature

	make (begining: DATE_TIME; ending: DATE_TIME)
		do
			start_time := begining
			end_time := ending
		ensure
			start_time = begining
			end_time = ending
		end

feature

	is_within_period (now: DATE_TIME): BOOLEAN
		do
			Result := now >= start_time and now <= end_time
		ensure
			Result = (now >= start_time and now <= end_time)
		end

feature

	start_time: DATE_TIME

	end_time: DATE_TIME

invariant
	valid_time_bounds: start_time <= end_time

end
