note
	description: "Summary description for {TESTS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TESTS

create
	make

feature

	make (id_station: ID_STATION)
		do
			tokeneer := id_station
			door := tokeneer.door
			finger := tokeneer.finger
			user_token := tokeneer.user_token
			admin_token := tokeneer.admin_token
			usb_drive := tokeneer.usb_drive
		end

feature -- Access

	door: DOOR

	finger: FINGERPRINT_READER

	user_token, admin_token: TOKEN_READER

	usb_drive: USB_DRIVE_READER

feature

	tokeneer: ID_STATION

end
