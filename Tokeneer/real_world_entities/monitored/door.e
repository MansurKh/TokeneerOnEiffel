note
	description: "{DOOR} supposed to track the state of the physical door."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.1"
	Z_schema: "DOOR"

class
	DOOR

inherit

	LOGGED

create
	make

feature {NONE} -- Initialization

	make (logger_: LOGGER)
		do
			logger := logger_
			close
				-- Initially the door is closed
		ensure
			door_is_closed: not is_open -- Z-schema: InitDoorLatchAlarm
		end

feature {TESTS} -- Actions
	-- Door is not controlled by the system, the following features are only for testing

	open
		do
			is_open := True
			logger.add_log ("Door opened")
		ensure
			is_open
		end

	close
		do
			is_open := False
			logger.add_log ("Door closed")
		ensure
			not is_open
		end

feature -- Access

	is_open: BOOLEAN
			-- In real system the feature `is_open' should be implemented as a query to a door sensor
			-- In current implementation `is_open' is atribute of the class values of which could
			-- be modified only while testing the system

end
