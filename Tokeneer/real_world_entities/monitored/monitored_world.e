note
	description: "{MONITORED_WORLD} agrigates all the real world entities that are monitored by TIS, but not controlled."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "18"
	Section: "2.7.2"
	Z_schema: "TISMonitoredRealWorld"

class
	MONITORED_WORLD

create
	make

feature {NONE} -- Initialization

	make (clock_: CLOCK; types: TYPES; logger: LOGGER)
		do
				-- Initialization of monitored world entities
			clock := clock_
			create door.make (logger)
			create finger.make (types, logger)
			create user_token.make (types, logger)
			create admin_token.make (types, logger)
			create usb_drive.make (types, logger)
			create keyboard.make (types, logger)
		end

feature -- Monitored entities
	-- According to Z-schema "TISMonitoredRealWorld"

	clock: CLOCK

	door: DOOR

	finger: FINGERPRINT_READER

	user_token, admin_token: TOKEN_READER

	usb_drive: USB_DRIVE_READER

	keyboard: KEYBOARD

end
