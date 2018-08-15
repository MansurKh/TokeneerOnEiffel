note
	description: "Summary description for {USB_DRIVE_STATES}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.1"

class
	USB_DRIVE_STATES

inherit

	BASIC_TYPE

create
	make

feature -- Values

	not_present: INTEGER
			-- The drive not being present
		once
			Result := id.new_id
		end

	no_data: INTEGER
			-- The drive is present, but empty
		once
			Result := id.new_id
		end

	bad_data: INTEGER
			-- The drive is present, but contains currupt data
		once
			Result := id.new_id
		end

	enrolment_file: INTEGER
			-- The drive is present and contains data for enrolment
		once
			Result := id.new_id
		end

	audit_file: INTEGER
			-- The drive is present and contains data for audit
		once
			Result := id.new_id
		end

	config_file: INTEGER
			-- The drive is present and contains configuration data
		once
			Result := id.new_id
		end

feature -- Query

	possible_values: SET [INTEGER]
			-- Possible states of usb_drive
		once
			create {LINKED_SET [INTEGER]} Result.make
			Result.extend (not_present)
			Result.extend (no_data)
			Result.extend (bad_data)
			Result.extend (enrolment_file)
			Result.extend (audit_file)
			Result.extend (config_file)
		ensure then
			Result.has (not_present)
			Result.has (no_data)
			Result.has (bad_data)
			Result.has (enrolment_file)
			Result.has (audit_file)
			Result.has (config_file)
		end

end
