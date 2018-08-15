note
	description: "Summary description for {TOKEN_TRY}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"

class
	TOKEN_TRY

inherit

	BASIC_TYPE

create
	make

feature -- Values

	no_token: INTEGER
			-- No token inserted
		once
			Result := id.new_id
		end

	bad_token: INTEGER
			-- All posible error codes that occure trying to capture token data
		once
			Result := id.new_id
		end

	good_token: INTEGER
			-- Valid token
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of token
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (no_token)
			Result.extend (bad_token)
			Result.extend (good_token)
		ensure then
			Result.has (no_token)
			Result.has (bad_token)
			Result.has (good_token)
		end

end
