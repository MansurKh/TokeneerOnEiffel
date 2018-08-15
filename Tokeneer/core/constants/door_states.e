note
	description: "Summary description for {DOOR_STATES}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"

class
	DOOR_STATES

inherit

	BASIC_TYPE

create
	make

feature -- Values

	open: INTEGER
			-- Door can be open
		once
			Result := id.new_id
		end

	closed: INTEGER
			-- Door can be closed
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of the door which can be `open' or `closed'
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (open)
			Result.extend (closed)
		ensure then
			Result.has (open)
			Result.has (closed)
		end

end
