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
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make (init_time: DATE_TIME)
		do
			Precursor (init_time)
			is_locked := True
		ensure then
			door_is_closed: is_locked
		end

feature -- Actions

	lock
		do
			is_locked := True
		ensure
			is_locked
		end

	unlock
		do
			is_locked := False
		ensure
			not is_locked
		end

feature -- State

	is_locked: BOOLEAN

end
