note
	description: "[
		{KEYBOARD_INPUT} is the input by the administrator. 
		It is validating the input string mappig it to certain opetation
		Available optrations are: archive_log, update_configuration, override_lock and shut_down
	]"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16, 22"
	Section: "2.7.1, 3.5"
	Z_schema: "KEYBOARD, ADMINOP"

class
	KEYBOARD_INPUT

inherit

	DATA

create
	make

feature

	make (operations_: OPERATIONS)
		do
			create last_input.make_empty
			operations := operations_
			operation := 0
		end

	read_input
		do
			io.readline
			last_input.copy (io.last_string)
			operation := operations.get_operation (last_input)
		ensure
			operation = operations.get_operation (last_input)
		end

feature -- Value

	operation: INTEGER
			-- value assigned to certain operation. Equal to 0 if no operation

feature {KEYBOARD} -- Access

	operations: OPERATIONS

feature {NONE} -- Implementation

	last_input: STRING

invariant
	valid_operation_if_any: operation = 0 xor operations.supported_operations.has (operation)
	input_opetation: (operation = 0 implies last_input.is_empty) and (last_input.is_empty implies operation = 0)
--	input_value: operation = 0 xor (operations.get_operation (last_input) = operation)

end
