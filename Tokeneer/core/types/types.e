note
	description: "Class contains basic types of the system"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "8"
	Section: "2.4"

class
	TYPES

create
	make

feature {NONE} -- Initialisation

	make
		note
			status: creator
		do
			create id.make
			create clearance.make (id)
			create presence.make (id)
			create privilege.make (id)
			create door_states.make (id)
			create latch_states.make (id)
			create alarm_states.make (id)
			create display_messages.make (id)
			create screen_messages.make (id)
		ensure
			id.is_active
		end

feature {ATTRIBUTE_CERTIFICATE} -- Clearance

	clearance: CLEARANCE
			-- Ordered classification on documents, areas and people

feature -- Presence

	presence: PRESENCE
			-- Possible states of physical entity which can be `present' or `absent'

feature {ATTRIBUTE_CERTIFICATE} -- Privileges

	privilege: PRIVILEGE
			-- Possible roles held by the Token user

feature {DOOR} -- Door states

	door_states: DOOR_STATES
			-- Possible states of the door which can be `open' or `closed'

feature {LATCH} -- Latch states

	latch_states: LATCH_STATES
			-- Possible states of the latch which can be `unlocked' or `locked'

feature {ALARM} -- Alarm states

	alarm_states: ALARM_STATES
			-- Possible states of the alarm which can be `silent' or `alarming'

feature -- Display messages

	display_messages: DISPLAY_MESSAGES
			-- Possible short messages presented to the user on the small display outside the enclave

feature -- Screen messages

	screen_messages: SCREEN_MESSAGES
			-- Possible messages that may appear on the TIS screen within the enclave


--feature -- Data statuses

--	no_data: INTEGER
--			-- Absence of data (token, finger) in reader
--		once
--			Result := id.new_id
--		end

--	bad_data: INTEGER
--			-- Presence of bad data (token, finger) in reader
--		once
--			Result := id.new_id
--		end

--	good_data: INTEGER
--			-- Presence of good data (token, finger) in reader
--		once
--			Result := id.new_id
--		end

--	data_statuses: ARRAY [INTEGER]
--			-- Possible statuses of the data being read by the system
--		do
--			create Result.make_empty
--				--			Result := Result & no_data & bad_data & good_data
--		end

feature -- Initial status
	-- enclave and user entry interfaces being quiescent

	quiescent: INTEGER
		once
			Result := id.new_id
		end

	enclave_quiescent: INTEGER
		once
			Result := id.new_id
		end

feature -- Authentication states

	got_user_token: INTEGER
		once
			Result := id.new_id
		end

	waiting_finger: INTEGER
		once
			Result := id.new_id
		end

	got_finger: INTEGER
		once
			Result := id.new_id
		end

	waiting_update_token: INTEGER
		once
			Result := id.new_id
		end

	waiting_entry: INTEGER
		once
			Result := id.new_id
		end

	waiting_remove_token_success: INTEGER
		once
			Result := id.new_id
		end

	waiting_remove_token_fail: INTEGER
		once
			Result := id.new_id
		end

feature -- Enrolment states
	-- must be performed before TIS can offer any of its normal operations

	not_enrolled: INTEGER
		once
			Result := id.new_id
		end

	waiting_enrol: INTEGER
		once
			Result := id.new_id
		end

	waiting_end_enrol: INTEGER
		once
			Result := id.new_id
		end

feature -- Administrive states

	got_admin_token: INTEGER
		once
			Result := id.new_id
		end

	waiting_remove_admin_token_fail: INTEGER
		once
			Result := id.new_id
		end

	waiting_start_admin_op: INTEGER
		once
			Result := id.new_id
		end

	waiting_finish_admin_op: INTEGER
		once
			Result := id.new_id
		end

	shutdown: INTEGER
			-- Models when the system is shut down
		once
			Result := id.new_id
		end

feature -- Status collections

	authentification_statuses: ARRAY [INTEGER]
		once
			create Result.make_empty
				--			Result := Result & quiescent & got_user_token & waiting_finger & got_finger & waiting_update_token & waiting_entry & waiting_remove_token_success & waiting_remove_token_fail
		end

	enclave_statuses: ARRAY [INTEGER]
		once
			create Result.make_empty
				--			Result := Result & not_enrolled & waiting_enrol & waiting_end_enrol & enclave_quiescent & got_admin_token & waiting_remove_admin_token_fail & waiting_start_admin_op & waiting_finish_admin_op & shutdown
		end

feature -- Screen states

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

	insert_enrolment_data: INTEGER
			-- possible message on the screen: 'PLEASE INSERT ENROLMENT DATA FLOPPY'
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

	archive_failed: INTEGER
			-- possible message on the screen: 'ARCHIVE FAILED: PLEASE ENTER NEW OPERATION'
		once
			Result := id.new_id
		end

	insert_blank_floppy: INTEGER
			-- possible message on the screen: 'INSERT BLANK FLOPPY'
		once
			Result := id.new_id
		end

	insert_config_data: INTEGER
			-- possible message on the screen: 'INSERT CONFIGURATION DATA FLOPPY'
		once
			Result := id.new_id
		end

	display_stats: INTEGER
			-- possible message on the screen
		once
			Result := id.new_id
		end

	display_config_data: INTEGER
			-- possible message on the screen
		once
			Result := id.new_id
		end

feature -- Screen states collections

	screen_states: ARRAY [INTEGER]
			-- Set of states of the screen
		do
			create Result.make_empty
				--			Result := Result & clear & welcome_admin & busy & remove_admin_token & close_door & request_admin_op & doing_op & invalid_request & invalid_data & insert_enrolment_data & validating_enrolment_data & enrolment_failed & archive_failed & insert_blank_floppy & insert_config_data & display_stats & display_config_data
		end

		--	texts: ARRAY[TUPLE [INTEGER, STRING]]
		--			-- actual messages to be displayed on the screen
		--		once
		--			create Result
		--			Result := Result.force (clear, "")
		--			Result := Result.force (welcome_admin, "WELCOME TO TIS")
		--			Result := Result.force (busy, "SYSTEM BUSY PLEASE WAIT")
		--			Result := Result.force (remove_admin_token, "REMOVE TOKEN")
		--			Result := Result.force (close_door, "CLOSE ENCLAVE DOOR")
		--			Result := Result.force (request_admin_op, "ENTER REQUIRED OPERATION")
		--			Result := Result.force (doing_op, "PERFORMING OPERATION PLEASE WAIT")
		--			Result := Result.force (invalid_request, "INVALID REQUEST: PLEASE ENTER NEW OPERATION")
		--			Result := Result.force (invalid_data, "INVALID DATA: PLEASE ENTER NEW OPERATION")
		--			Result := Result.force (archive_failed, "ARCHIVE FAILED: PLEASE ENTER NEW OPERATION")
		--			Result := Result.force (insert_enrolment_data, "PLEASE INSERT ENROLMENT DATA FLOPPY")
		--			Result := Result.force (validating_enrolment_data, "VALIDATING ENROLMENT DATA PLEASE WAIT")
		--			Result := Result.force (enrolment_failed, "INVALID ENROLMENT DATA")
		--			Result := Result.force (insert_blank_floppy, "INSERT BLANK FLOPPY")
		--			Result := Result.force (insert_config_data, "INSERT CONFIGURATION DATA FLOPPY")
		--		end

feature {DISPLAY, INTERFACE, USER_ENTRY} -- Display states collections

	display_states: ARRAY [INTEGER]
			-- States of display outside the enclave.
		once
			create Result.make_empty
				--			Result := Result & blank & welcome & insert_finger & open_door & wait & remove_token & token_update_failed & door_unlocked
		end

		--	messages: ARRAY[TUPLE [INTEGER, STRING]]
		--			-- Short messages presented to the user on the small display outside of enclave.
		--		once
		--			create Result.make_empty
		--			Result := Result.force (blank, "SYSTEM NOT OPERATIONAL %N%N")
		--			Result := Result.force (welcome, "WELCOME TO TIS %N ENTER TOKEN %N")
		--			Result := Result.force (insert_finger, "AUTHENTICATING USER %N PLEASE INSERT FINGER %N")
		--			Result := Result.force (open_door, "AUTHENTICATING USER %N PLEASE WAIT %N")
		--			Result := Result.force (wait, "%N REMOVE TOKEN AND ENTER %N")
		--			Result := Result.force (remove_token, "ENTRY DENIED %N REMOVE TOKEN %N")
		--			Result := Result.force (token_update_failed, "%N TOKEN UPDATE FAILED %N")
		--			Result := Result.force (door_unlocked, "%N ENTER ENCLAVE %N")
		--		end

feature {NONE} -- Implementation

	id: ID_GENERATOR
			-- generates new identifier whenever `new_id' is called

invariant
	id /= Void

end
