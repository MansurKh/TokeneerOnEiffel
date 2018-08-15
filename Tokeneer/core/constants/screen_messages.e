note
	description: "Summary description for {SCREEN_MESSAGES}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"
	Table: "2.1"

class
	SCREEN_MESSAGES

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
			create messages_to_display.make (elem_count)
			messages_to_display.extend ("", clear)
			messages_to_display.extend ("WELCOME TO TIS", welcome_admin)
			messages_to_display.extend ("SYSTEM BUSY PLEASE WAIT", busy)
			messages_to_display.extend ("REMOVE TOKEN", remove_admin_token)
			messages_to_display.extend ("CLOSE ENCLAVE DOOR", close_door)
			messages_to_display.extend ("ENTER REQUIRED OPERATION", request_admin_op)
			messages_to_display.extend ("PERFORMING OPERATION PLEASE WAIT", doing_op)
			messages_to_display.extend ("INVALID REQUEST: PLEASE ENTER NEW OPERATION", invalid_request)
			messages_to_display.extend ("INVALID DATA: PLEASE ENTER NEW OPERATION", invalid_data)
			messages_to_display.extend ("ARCHIVE FAILED: PLEASE ENTER NEW OPERATION", archive_failed)
			messages_to_display.extend ("PLEASE INSERT ENROLMENT DATA USB DRIVE", insert_enrolment_data)
			messages_to_display.extend ("VALIDATING ENROLMENT DATA PLEASE WAIT", validating_enrolment_data)
			messages_to_display.extend ("INVALID ENROLMENT DATA", enrolment_failed)
			messages_to_display.extend ("INSERT BLANK USB DRIVE", insert_blank_usb_drive)
			messages_to_display.extend ("INSERT CONFIGURATION DATA USB DRIVE", insert_config_data)
		end

feature -- Display states

	clear: INTEGER
			-- possible message on the screen: ''
		once
			Result := id.new_id
		end

	welcome_admin: INTEGER
			-- possible message on the screen: 'WELCOME TO TIS'
		once
			Result := id.new_id
		end

	busy: INTEGER
			-- possible message on the screen: 'SYSTEM BUSY PLEASE WAIT'
		once
			Result := id.new_id
		end

	remove_admin_token: INTEGER
			-- possible message on the screen: 'REMOVE TOKEN'
		once
			Result := id.new_id
		end

	close_door: INTEGER
			-- possible message on the screen: 'CLOSE ENCLAVE DOOR'
		once
			Result := id.new_id
		end

	request_admin_op: INTEGER
			-- possible message on the screen: 'ENTER REQUIRED OPERATION'
		once
			Result := id.new_id
		end

	doing_op: INTEGER
			-- possible message on the screen: 'PERFORMING OPERATION PLEASE WAIT'
		once
			Result := id.new_id
		end

	invalid_request: INTEGER
			-- possible message on the screen: 'INVALID REQUEST: PLEASE ENTER NEW OPERATION'
		once
			Result := id.new_id
		end

	invalid_data: INTEGER
			-- possible message on the screen: 'INVALID DATA: PLEASE ENTER NEW OPERATION'
		once
			Result := id.new_id
		end

	archive_failed: INTEGER
			-- possible message on the screen: 'ARCHIVE FAILED: PLEASE ENTER NEW OPERATION'
		once
			Result := id.new_id
		end

	insert_enrolment_data: INTEGER
			-- possible message on the screen: 'PLEASE INSERT ENROLMENT DATA USB DRIVE'
		once
			Result := id.new_id
		end

	validating_enrolment_data: INTEGER
			-- possible message on the screen: 'VALIDATING ENROLMENT DATA PLEASE WAIT'
		once
			Result := id.new_id
		end

	enrolment_failed: INTEGER
			-- possible message on the screen: 'INVALID ENROLMENT DATA'
		once
			Result := id.new_id
		end

	insert_blank_usb_drive: INTEGER
			-- possible message on the screen: 'INSERT BLANK USB DRIVE'
		once
			Result := id.new_id
		end

	insert_config_data: INTEGER
			-- possible message on the screen: 'INSERT CONFIGURATION DATA USB DRIVE'
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: LINKED_SET [INTEGER]
			-- All possible messages on the screen
		once
			create Result.make
--			Result := messages_to_display.current_keys
		ensure then
			Result.has (clear)
			Result.has (welcome_admin)
			Result.has (busy)
			Result.has (remove_admin_token)
			Result.has (close_door)
			Result.has (request_admin_op)
			Result.has (doing_op)
			Result.has (invalid_request)
			Result.has (invalid_data)
			Result.has (archive_failed)
			Result.has (insert_enrolment_data)
			Result.has (validating_enrolment_data)
			Result.has (enrolment_failed)
			Result.has (insert_blank_usb_drive)
			Result.has (insert_config_data)
		end

	get_display_message (state: INTEGER): detachable STRING
			-- display specific message on the TIS screen within the enclave
		require
			possible_values.has (state)
		do
			Result := messages_to_display.at (state)
		end

feature {NONE} -- Implementation

	messages_to_display: HASH_TABLE [STRING, INTEGER]
			-- Messages that may appear on the TIS screen within the enclave

invariant

end
