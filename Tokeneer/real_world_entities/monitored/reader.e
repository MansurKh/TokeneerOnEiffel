note
	description: "Summary description for {READER}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "Generelized from UserToken, AdminToken, Finger and Floppy"

deferred class
	READER

feature {NONE} -- Initialization

	make (types: TYPES)
		do
			is_data_present := False
				-- initially there is no data (token, finger, usb drive etc.) in reader
		end

feature {TESTES} -- Actions

	provide_bad_fingerprint
		do
		end

	provide_good_fingerprint
		do
		end

feature -- Command

	read_the_data
		deferred
		end

feature -- State

	is_data_present: BOOLEAN

	data: detachable DATA

end
