note
	description: "{ENCLAVE_STATUSES} describes purly internal records of the progress through all activities performed within the enclave."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "24"
	Z_schema: "Audit"
	Section: "3.7"

class
	ENCLAVE_STATUSES

inherit

	BASIC_TYPE

create
	make

feature -- Enrolment statuses

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

	enclave_quiescent: INTEGER
		once
			Result := id.new_id
		end

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

feature -- Query

	possible_values: SET [INTEGER]
			-- Roles held by the Token user
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (not_enrolled)
			Result.extend (waiting_enrol)
			Result.extend (waiting_end_enrol)
			Result.extend (enclave_quiescent)
			Result.extend (got_admin_token)
			Result.extend (waiting_remove_admin_token_fail)
			Result.extend (waiting_start_admin_op)
			Result.extend (waiting_finish_admin_op)
			Result.extend (shutdown)
		ensure then
			Result.has (not_enrolled)
			Result.has (waiting_enrol)
			Result.has (waiting_end_enrol)
			Result.has (enclave_quiescent)
			Result.has (got_admin_token)
			Result.has (waiting_remove_admin_token_fail)
			Result.has (waiting_start_admin_op)
			Result.has (waiting_finish_admin_op)
			Result.has (shutdown)
		end

end
