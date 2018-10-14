note
	description: "{USB_DRIVE_READER} is used instead of floppy."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.1"
	Z_schema: "FLOPPY"

class
	USB_DRIVE_READER

inherit

	READER
		rename
			is_data_present as is_file_present,
			data as current_file,
			read_the_data as read_the_file
		redefine
			current_file
		end

create
	make

feature -- Command

	read_the_file
		do
		ensure then
			written_file ~ old written_file
		end

feature -- Access

	current_file: detachable USB_FILE

	written_file: detachable USB_FILE

end
