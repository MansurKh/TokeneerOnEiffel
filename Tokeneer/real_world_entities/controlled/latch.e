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

create
	make

end
