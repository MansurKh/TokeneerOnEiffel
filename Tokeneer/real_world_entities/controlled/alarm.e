note
	description: "{ALARM} is an audible alarm."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16, 23"
	Section: "2.7.2, 3.6"
	Z_schemas: "TISControlledRealWorld, DoorLatchAlarm"

class
	ALARM

inherit

	TIMED
		rename
			make as set_up_timer
		end

	LOGGED

create
	make

feature {NONE} -- Initialization

	make (init_time: DATE_TIME; logger_: LOGGER)
		do
			set_up_timer (init_time)
			set_up_logger (logger_)
			turn_off
		ensure then
			not alarming
		end

feature -- Actions

	turn_on
		do
			alarming := True
			logger.add_log ("Alarming")
		ensure
			alarming
		end

	turn_off
		do
			alarming := False
			logger.add_log ("Alarm is silenced")
		ensure
			not alarming
		end

feature -- Access

	alarming: BOOLEAN
			-- actuator for the alarm bell

end
