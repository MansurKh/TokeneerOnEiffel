note
	description: "{KEYBOARD} is used by administrators to input the operation to be performed."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "18"
	Section: "2.7.2"
	Z_schema: "KEYBOARD, TISMonitoredRealWorld"

class
	KEYBOARD

inherit

	READER
		rename
			is_data_present as is_input_present,
			data as current_input,
			read_the_data as read_operation
		redefine
			current_input,
			make
		end

create
	make

feature {NONE} -- Initialization

	make (types: TYPES; logger_: LOGGER)
		do
			logger := logger_
			create current_input.make (types.operations)
		ensure then

		end

feature -- Command

	read_operation
		do
			current_input.read_input
		ensure then
			current_input.operations.supported_operations.has (current_input.operation)
		end

feature -- Access

	current_input: KEYBOARD_INPUT

end
