note
	description: "{SCREEN} is a screen on the ID Station within the enclave with which the administrator interacts"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISControlledRealWorld"

class
	SCREEN

create
	make

feature

	make (types: TYPES)
		do
			messages := types.screen_messages
			stats := messages.clear
			msg := messages.clear
			config := messages.clear
		end

feature -- Setters

	set_stats (val: INTEGER)
			-- `set_stats' sets the statistics message in the screen
		require
			messages.possible_values.has (val)
		do
			stats := val
		ensure
			stats = val
		end

	set_msg (val: INTEGER)
			-- `set_msg' sets the messge in the screen
		require
			messages.possible_values.has (val)
		do
			msg := val
		ensure
			msg = val
		end

	set_config (val: INTEGER)
			-- `set_config' sets the configuration message in the screen
		require
			messages.possible_values.has (val)
		do
			config := val
		ensure
			config = val
		end

feature

	stats: INTEGER assign set_stats

	msg: INTEGER assign set_msg

	config: INTEGER assign set_config

	messages: SCREEN_MESSAGES

invariant
	valid_stats: messages.possible_values.has (stats)
	valid_msg: messages.possible_values.has (msg)
	valid_config: messages.possible_values.has (config)

end
