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
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make (init_time: DATE_TIME)
		do
			Precursor (init_time)
			alarming := False
		ensure then
			not alarming
		end

feature -- Actions

	turn_on
		do
			alarming := True
		ensure
			alarming
		end

	turn_off
		do
			alarming := False
		ensure
			not alarming
		end

feature -- Access

	alarming: BOOLEAN

end
