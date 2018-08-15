note
	description: "Summary description for {KEYBOARD_INPUTS}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.1"

class
	KEYBOARD_INPUTS

inherit

	BASIC_TYPE

create
	make

feature -- Values

	no_input: INTEGER
			-- No data
		once
			Result := id.new_id
		end

	bad_input: INTEGER
			-- Invalid data
		once
			Result := id.new_id
		end

	good_input: INTEGER
			-- Valid data to perfor an administrator operation
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible inputs that may be supplied by an administratior
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (no_input)
			Result.extend (bad_input)
			Result.extend (good_input)
		ensure then
			Result.has (no_input)
			Result.has (bad_input)
			Result.has (good_input)
		end

end
