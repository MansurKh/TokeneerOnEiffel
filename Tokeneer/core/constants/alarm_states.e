note
	description: "Summary description for {ALARM_STATES}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"

class
	ALARM_STATES

inherit

	BASIC_TYPE

create
	make

feature -- Values

	silent: INTEGER
			-- Alarn can be silent
		once
			Result := id.new_id
		end

	alarming: INTEGER
			-- Alarn can be alarming
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of the alarm which can be `silent' or `alarming'
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (silent)
			Result.extend (alarming)
		ensure then
			Result.has (silent)
			Result.has (alarming)
		end

end
