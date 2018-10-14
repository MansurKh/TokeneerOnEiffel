note
	description: "[
		{LOG_ELEMENT} is the single log entry, recording at least time of event, type of event, user if known
		Each log element has associated with it a size, which may vary between audit elements
	]"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "20"
	Z_schema: "Audit"
	Section: "3.2"

class
	LOG_ELEMENT

create
	make

feature

	make (time_stamp_: DATE_TIME)
		do
			time_stamp := time_stamp_
		end

feature -- Access

	size: INTEGER

	time_stamp: DATE_TIME

	type: INTEGER

		--	user: detachable USER

end
