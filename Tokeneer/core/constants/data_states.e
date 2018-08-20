note
	description: "Summary description for {KEYBOARD_INPUTS}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.1"

class
	DATA_STATES

inherit

	BASIC_TYPE

create
	make

feature -- Values

	no_data: INTEGER
			-- No data
		once
			Result := id.new_id
		end

	bad_data: INTEGER
			-- Invalid data
		once
			Result := id.new_id
		end

	good_data: INTEGER
			-- Valid data to perfor an administrator operation
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible inputs that may be supplied by an administratior
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (no_data)
			Result.extend (bad_data)
			Result.extend (good_data)
		ensure then
			Result.has (no_data)
			Result.has (bad_data)
			Result.has (good_data)
		end

end
