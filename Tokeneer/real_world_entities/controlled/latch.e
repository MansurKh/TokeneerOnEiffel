note
	description: "{LATCH} is a latch on the door into the enclave"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16, 23"
	Section: "2.7.2, 3.6"
	Z_schemas: "TISControlledRealWorld, DoorLatchAlarm"

class
	LATCH

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
			lock
		ensure then
			door_is_closed: is_locked
		end

feature -- Actions

	lock
		do
			is_locked := True
			logger.add_log("Door latched")
		ensure
			is_locked
		end

	unlock
		do
			is_locked := False
			logger.add_log("Door unlatched")
		ensure
			not is_locked
		end

feature -- State

	is_locked: BOOLEAN

end
