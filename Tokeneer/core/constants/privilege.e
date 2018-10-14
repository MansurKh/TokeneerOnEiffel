note
	description: "{PRIVILEGE} describes possible roles held by the Token user."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "9"
	Section: "2.4"

class
	PRIVILEGE

inherit

	BASIC_TYPE

create
	make

feature -- Values

	userOnly: INTEGER
			-- Privilege `userOnly'
		once
			Result := id.new_id
		end

	guard: INTEGER
			-- Privilege `guard'
		once
			Result := id.new_id
		end

	securityOfficer: INTEGER
			-- Privilege `securityOfficer'
		once
			Result := id.new_id
		end

	auditManager: INTEGER
			-- Privilege `auditManager'
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Roles held by the Token user
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (userOnly)
			Result.extend (guard)
			Result.extend (securityOfficer)
			Result.extend (auditManager)
		ensure then
			Result.has (userOnly)
			Result.has (guard)
			Result.has (securityOfficer)
			Result.has (auditManager)
		end

end
