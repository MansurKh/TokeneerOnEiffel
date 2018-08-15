note
	description: "Tokeneer application root class"
	date: "$Date$"
	revision: "$Revision$"

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
			--| Add your code here
			print ("Hello Eiffel World!%N")
		end

end
