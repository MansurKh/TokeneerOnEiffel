note
	description: "{TIMED} is ancestor of classes equipped with timeout feature to limit the time of being in some certain state"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.2"
	Z_schema: "TISControlledRealWorld"

deferred class
	TIMED

feature {NONE} -- Initialization

	make (time: DATE_TIME)
		do
			timeout := time
		ensure
			new_value_set: timeout = time
		end

feature -- Setter

	set_timeout (time: DATE_TIME)
		do
			timeout := time
		ensure
			new_value_set: timeout = time
		end

feature

	timeout: DATE_TIME assign set_timeout

end
