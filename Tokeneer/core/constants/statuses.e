note
	description: "{STATUSES} describes purly internal records of the progress through user entry."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "24"
	Z_schema: "Audit"
	Section: "3.7"

class
	STATUSES

inherit

	BASIC_TYPE

create
	make

feature -- Authentication states

	quiescent: INTEGER
		once
			Result := id.new_id
		end

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

feature -- Query

	possible_values: SET [INTEGER]
			-- Roles held by the Token user
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (quiescent)
			Result.extend (got_user_token)
			Result.extend (waiting_finger)
			Result.extend (got_finger)
			Result.extend (waiting_update_token)
			Result.extend (waiting_entry)
			Result.extend (waiting_remove_token_success)
			Result.extend (waiting_remove_token_fail)
		ensure then
			Result.has (quiescent)
			Result.has (got_user_token)
			Result.has (waiting_finger)
			Result.has (got_finger)
			Result.has (waiting_update_token)
			Result.has (waiting_entry)
			Result.has (waiting_remove_token_success)
			Result.has (waiting_remove_token_fail)
		end

end
