note
	description: "Summary description for {FINGERPRINT_READER}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISMonitoredRealWorld"

class
	FINGERPRINT_READER

inherit

	READER
		rename
			is_data_present as is_finger_present,
			data as current_fingerprint,
			read_the_data as read_fingerprint
		redefine
			current_fingerprint
		end

create
	make

feature -- Command

	read_fingerprint
		do
			create current_fingerprint
		end

feature -- Access

	current_fingerprint: detachable FINGERPRINT

invariant

end
