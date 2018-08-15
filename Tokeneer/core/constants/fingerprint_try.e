note
	description: "Summary description for {FINGERPRINT_TRY}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "15"
	Section: "2.7.1"

class
	FINGERPRINT_TRY

inherit

	BASIC_TYPE

create
	make

feature -- Values

	no_fingerprint: INTEGER
			-- No fingerprint inserted
		once
			Result := id.new_id
		end

	bad_fingerprint: INTEGER
			-- All posible error codes that occure trying to capture fingerprint data
		once
			Result := id.new_id
		end

	good_fingerprint: INTEGER
			-- Valid fingerpint
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of physical entity which can be `present' or `absent'
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (no_fingerprint)
			Result.extend (bad_fingerprint)
			Result.extend (good_fingerprint)
		ensure then
			Result.has (no_fingerprint)
			Result.has (bad_fingerprint)
			Result.has (good_fingerprint)
		end

end
