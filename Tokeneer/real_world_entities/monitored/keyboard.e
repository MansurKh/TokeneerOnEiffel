note
	description: "Summary description for {KEYBOARD}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISMonitoredRealWorld"

class
	KEYBOARD

inherit

	READER
		rename
			is_data_present as is_input_present,
			data as current_input,
			read_the_data as read_the_input
		redefine
			current_input
		end


feature -- Command

	read_the_input
		do
		end

feature -- Access

	current_input: detachable KEYBOARD_INPUT

end
