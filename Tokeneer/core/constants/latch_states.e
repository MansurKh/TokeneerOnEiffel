note
	description: "Summary description for {LATCH_STATES}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"

class
	LATCH_STATES

inherit

	BASIC_TYPE

create
	make

feature -- Values

	unlocked: INTEGER
			-- Latch unlocked
		once
			Result := id.new_id
		end

	locked: INTEGER
			-- Latch locked
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of the latch which can be `unlocked' or `locked'
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (unlocked)
			Result.extend (locked)
		ensure then
			Result.has (unlocked)
			Result.has (locked)
		end

end
