note
	description: "Summary description for {DOOR}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISMonitoredRealWorld"

class
	DOOR

create
	make

feature {NONE} -- Initialization

	make
		do
			is_open := False
		ensure
			door_is_closed: not is_open -- Z-schema: InitDoorLatchAlarm
		end

feature {TESTS} -- Actions
	-- Door is not controlled by the system

	open
		do
			is_open := True
		ensure
			is_open
		end

	close
		do
			is_open := False
		ensure
			not is_open
		end

feature -- Access

	is_open: BOOLEAN

end
