note
	description: "{SCREEN} is a screen on the ID Station within the enclave with which the administrator interacts"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISControlledRealWorld"

class
	SCREEN

inherit

	LOGGED

create
	make

feature

	make (types: TYPES; logger_: LOGGER)
		do
			messages := types.screen_messages
			set_up_logger (logger_)
			display(messages.insert_enrolment_data)
		ensure
			messages = types.screen_messages
			state = messages.insert_enrolment_data
		end

feature -- Setters

	display (new_state: INTEGER)
			-- Set the state of the screen to `new_state' and output corresponding message
		require
			messages.possible_values.has (new_state)
		do
			if state /= new_state then
				state := new_state
				logger.add_log ("Screen message was set to: '" + messages.get_screen_message (state) +"' " )
			end
		ensure
			state = new_state
		end

feature

	state: INTEGER assign display

	messages: SCREEN_MESSAGES

invariant
	valid_stats: messages.possible_values.has (state)

end
