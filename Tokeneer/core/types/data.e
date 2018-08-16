note
	description: "Summary description for {DATA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	DATA

	--feature -- Data statuses

	--	no_data: INTEGER
	--			-- Absence of data (token, finger) in reader
	--		once
	--			Result := id.new_id
	--		end

	--	bad_data: INTEGER
	--			-- Presence of bad data (token, finger) in reader
	--		once
	--			Result := id.new_id
	--		end

	--	good_data: INTEGER
	--			-- Presence of good data (token, finger) in reader
	--		once
	--			Result := id.new_id
	--		end

	--	data_statuses: ARRAY [INTEGER]
	--			-- Possible statuses of the data being read by the system
	--		do
	--			create Result.make_empty
	--				--			Result := Result & no_data & bad_data & good_data
	--		end

end
