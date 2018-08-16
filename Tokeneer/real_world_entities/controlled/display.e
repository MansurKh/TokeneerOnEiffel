note
	description: "{DISPLAY} is a display that resides outside the enclave."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISControlledRealWorld"

class
	DISPLAY
create
	make

feature

	make (types: TYPES)
		do
			messages := types.display_messages
			message := messages.blank
		ensure
			message = messages.blank
		end

feature

	display (msg: INTEGER)
		require
			messages.possible_values.has (msg)
		do
			message := msg
		ensure
			message = msg
		end

feature -- State

	message: INTEGER assign display

	messages: DISPLAY_MESSAGES

end
