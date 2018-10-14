note
	description: "Tokeneer application root class"
	author: "Mansur Khazeev"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
		local
			tokeneer: ID_STATION
		do
			print ("Creating nonenrlolled:%N")
			create tokeneer.start_nonenrolled_station
			print ("%NCreating enrlolled:%N")
			create tokeneer.start_enrolled_station
		end

end
