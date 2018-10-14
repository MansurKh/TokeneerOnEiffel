note
	description: "{CONTROLLED_WORLD} agrigates all the real world entities that are controlled by TIS."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16-17"
	Section: "2.7.2"
	Z_schema: "TISControlledRealWorld"

class
	CONTROLLED_WORLD

create
	make

feature {NONE} -- Initialization

	make (start_time: DATE_TIME; types: TYPES; logger: LOGGER)
		do
				-- Controlled world entities
			create latch.make (start_time, logger)
			create alarm.make (start_time, logger)
			create display.make (types, logger)
			create screen.make (types, logger)
		end

feature -- Controlled entities
	-- According to Z-schema "TISControlledRealWorld"

	latch: LATCH

	alarm: ALARM

	display: DISPLAY

	screen: SCREEN

end
