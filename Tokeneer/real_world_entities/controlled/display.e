note
	description: "{DISPLAY} is a display that resides outside the enclave."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISControlledRealWorld"

class
	DISPLAY

inherit

	LOGGED

create
	make

feature

	make (types: TYPES; logger_: LOGGER)
		do
			messages := types.display_messages
			set_up_logger (logger_)
			display (messages.blank)
		ensure
			state = messages.blank
		end

feature

	display (msg: INTEGER)
		-- Set the state of the display to `msg' and output corresponding message
		require
			messages.possible_values.has (msg)
		local
			message: STRING
		do
			if state /= msg then
				state := msg
				if attached messages.get_display_messages (state) as message_tuple then
					message := "Display message was set to: on top '" + message_tuple.top + "' on buttom '" + message_tuple.bottom +"'"
					logger.add_log (message)
				end
			end
		ensure
			state = msg
		end

feature -- State

	state: INTEGER assign display

	messages: DISPLAY_MESSAGES

end
