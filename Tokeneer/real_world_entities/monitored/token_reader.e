note
	description: "{TOKEN_READER}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "18"
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

create
	make

feature

	read_the_token
		do
		end

feature -- Access

	current_token: detachable TOKEN

end
