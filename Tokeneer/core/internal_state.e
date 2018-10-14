note
	description: "[
		{INTERNAL_STATE} describes the state of the system as a tuple of two statuses. One is the statues of users
		entry process `status' and the other is `enclave status' which describe the process of interraction of the admin with the 
		enclave interface
		]"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "24"
	Z_schema: "Internal"

deferred class
	INTERNAL_STATE

inherit

	TIMED
		rename
			timeout as token_removal_timeout,
			make as initialize_timeout
		end

feature {NONE} -- Initialization

	make (start_time: DATE_TIME; types: TYPES)
		local
			time: DATE_TIME
		do
			statuses := types.statuses
			enclave_statuses := types.enclave_statuses
			initialize_timeout (start_time)
			enclave_status := enclave_statuses.not_enrolled
			status := statuses.quiescent
		ensure
			initially_quiescent: status = statuses.quiescent
			initially_not_enrolled: enclave_status = enclave_statuses.not_enrolled
		end

feature {ID_STATION} -- Commands

	set_status (new_status: INTEGER)
		require
			statuses.possible_values.has (new_status)
		do
			status := new_status
			apply_status
		ensure
			status = new_status
		end

	set_enclave_status (new_status: INTEGER)
		require
			enclave_statuses.possible_values.has (new_status)
		do
			enclave_status := new_status
			apply_enclave_status
		ensure
			enclave_status = new_status
		end

feature {NONE} -- State transitions

	set_to_quiesent
		deferred
		ensure
			status = statuses.quiescent
		end

	set_to_got_user_token
		require
			got_user_token_precondition
		deferred
		ensure
			status = statuses.got_user_token
		end

	set_to_waiting_finger
		require
			waiting_finger_precondition
		deferred
		ensure
			status = statuses.waiting_finger
		end

	set_to_got_finger
		require
			got_finger_precondition
		deferred
		ensure
			status = statuses.got_finger
		end

	set_to_waiting_update_token
		require
			waiting_update_token_precondition
		deferred
		ensure
			status = statuses.got_finger
		end

	set_to_waiting_entry
		require
			waiting_entry_precondition
		deferred
		ensure
			status = statuses.waiting_entry
		end

	set_to_token_fail
		require
			token_fail_precondition
		deferred
		ensure
			status = statuses.waiting_remove_token_fail
		end

	set_to_token_success
		require
			token_success_precondition
		deferred
		ensure
			status = statuses.waiting_remove_token_success
		end

feature {NONE} -- States preconditions

	got_user_token_precondition: BOOLEAN
		do
			Result := (status = statuses.quiescent)
		end

	waiting_finger_precondition: BOOLEAN
		do
			Result := (status = statuses.got_user_token)
		end

	got_finger_precondition: BOOLEAN
		do
			Result := (status = statuses.waiting_finger)
		end

	waiting_update_token_precondition: BOOLEAN
		do
			Result := (status = statuses.waiting_finger)
		end

	waiting_entry_precondition: BOOLEAN
		do
			Result := (status = statuses.got_user_token or status = statuses.waiting_update_token)
		end

	token_fail_precondition: BOOLEAN
		do
			Result := (not (status = statuses.quiescent))
		end

	token_success_precondition: BOOLEAN
		do
			Result := (status = statuses.waiting_entry)
		end

feature {NONE} -- Helpers

	apply_status
			-- applies the state change to controlled entities
		deferred
		end

	apply_enclave_status
			-- applies the enclave state change to controlled entities
		deferred
		end

feature

	status: INTEGER assign set_status

	enclave_status: INTEGER assign set_enclave_status

feature

	statuses: STATUSES

	enclave_statuses: ENCLAVE_STATUSES

invariant
	statuses.possible_values.has (status)
	enclave_statuses.possible_values.has (enclave_status)

end
