note
	description: "Summary description for {PRESENCE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "8"
	Section: "2.4"

class
	PRESENCE

inherit

	BASIC_TYPE

create
	make

feature -- Values

	present: INTEGER
			-- Presence of entity
		once
			Result := id.new_id
		end

	absent: INTEGER
			-- Absence of entity
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of physical entity which can be `present' or `absent'
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (present)
			Result.extend (absent)
		ensure then
			Result.has (present)
			Result.has (absent)
		end

end
