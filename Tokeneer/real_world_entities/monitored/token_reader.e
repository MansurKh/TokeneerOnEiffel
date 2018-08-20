note
	description: "Summary description for {TOKEN_READER}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISMonitoredRealWorld"

class
	TOKEN_READER

inherit

	READER
		rename
			is_data_present as is_token_present,
			data as current_token,
			read_the_data as read_the_token
		redefine
			current_token
		end

feature

	read_the_token
		do
		end

feature -- Access

	current_token: detachable TOKEN

end
