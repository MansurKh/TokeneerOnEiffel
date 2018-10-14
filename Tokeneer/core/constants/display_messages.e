note
	description: "{DISPLAY_MESSAGES} describe possible messages on the display that resides outside the enclave."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"
	Table: "2.1"

class
	DISPLAY_MESSAGES

inherit

	BASIC_TYPE
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make (id_generator: ID_GENERATOR)
		do
			precursor (id_generator)
			elem_count := 8 -- There are 8 different messages to be diplayed
			create messages_to_display.make (elem_count)
			messages_to_display.extend (["SYSTEM NOT OPERATIONAL", ""], blank)
			messages_to_display.extend (["WELCOME TO TIS", "ENTER TOKEN"], welcome)
			messages_to_display.extend (["AUTHENTICATING USER", "INSERT FINGER"], insert_finger)
			messages_to_display.extend (["AUTHENTICATING USER", "PLEASE WAIT"], wait)
			messages_to_display.extend (["", "REMOVE TOKEN AND ENTER"], open_door)
			messages_to_display.extend (["ENTRY DENIED", "REMOVE TOKEN"], remove_token)
			messages_to_display.extend (["", "TOKEN UPDATE FAILED"], token_update_failed)
			messages_to_display.extend (["", "ENTER ENCLAVE"], door_unlocked)
		end

feature -- Display states

	blank: INTEGER
			-- possible message on the diplay. `blank': 'SYSTEM NOT OPERATIONAL'
		once
			Result := id.new_id
		end

	welcome: INTEGER
			-- possible message on the diplay. `welcome': 'WELCOME TO TIS - ENTER TOKEN'
		once
			Result := id.new_id
		end

	insert_finger: INTEGER
			-- possible message on the diplay. `insert_finger': 'AUTHENTICATING USER - INSERT FINGER'
		once
			Result := id.new_id
		end

	wait: INTEGER
			-- possible message on the diplay. `wait': 'AUTHENTICATING USER - PLEASE WAIT'
		once
			Result := id.new_id
		end

	open_door: INTEGER
			-- possible message on the diplay. `open_door': 'REMOVE TOKEN AND ENTER'
		once
			Result := id.new_id
		end

	remove_token: INTEGER
			-- possible message on the diplay. `remove_token': 'ENTRY DENIED - REMOVE TOKEN'
		once
			Result := id.new_id
		end

	token_update_failed: INTEGER
			-- possible message on the diplay. `token_update_failed': 'TOKEN UPDATE FAILED'
		once
			Result := id.new_id
		end

	door_unlocked: INTEGER
			-- possible message on the diplay. `door_unlocked': 'ENTER ENCLAVE'
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: LINKED_SET [INTEGER]
			-- All possible messages that might appear on the display
		once
			create Result.make
			across
				messages_to_display.current_keys as keys
			loop
				Result.extend (keys.item)
			end
		ensure then
			Result.has (blank)
			Result.has (welcome)
			Result.has (insert_finger)
			Result.has (wait)
			Result.has (open_door)
			Result.has (remove_token)
			Result.has (token_update_failed)
			Result.has (door_unlocked)
		end

	get_display_messages (state: INTEGER): detachable TUPLE [top:STRING; bottom:STRING]
			-- display specific messages on top and bottom lines of the diplay appropriate for the `state'
		require
			possible_values.has (state)
		do
			Result := messages_to_display.at (state)
		end

feature {NONE} -- Implementation

	messages_to_display: HASH_TABLE [TUPLE [top:STRING; bottom:STRING], INTEGER]
			-- Top and bottom line messages which corresponds to a certain display state

end
