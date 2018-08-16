note
	description: "Summary description for {REAL_WORLD}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "18"
	Section: "2.7.2"
	Z_schema: "RealWorld"

class
	REAL_WORLD

create
	make

feature {NONE} -- Initialization

	make
		local
			time: DATE_TIME
		do
			-- TODO: set time out period from config
			create time.make_now

			create types.make
				-- Controlled world entities
			create latch.make (time)
			create alarm.make (time)
			create display.make (types)
			create screen.make (types)
				-- Monitored world entities
			create now
			create door.make
			create finger
			create user_token
			create admin_token
			create usb_drive
			create keyboard
		end

feature -- Controlled entities
	-- According to Z-schema "TISControlledRealWorld"

	latch: LATCH

	alarm: ALARM

	display: DISPLAY

	screen: SCREEN

feature -- Monitored entities
	-- According to Z-schema "TISMonitoredRealWorld"

	now: TIMER

	door: DOOR

	finger: FINGERPRINT_READER

	user_token, admin_token: TOKEN_READER

	usb_drive: USB_DRIVE_READER

	keyboard: KEYBOARD

feature -- Access

	types: TYPES

invariant



end
