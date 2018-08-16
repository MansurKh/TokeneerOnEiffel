note
	description: "Summary description for {DOOR}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISMonitoredRealWorld"

class
	DOOR

feature {NONE} -- Initialization

	make
		do
			is_open := FALSE
		ensure
			door_is_closed: not is_open
		end

feature -- Access

	is_open: BOOLEAN

end
