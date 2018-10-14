note
	description: "{LOGGER} is used for outputing state changes in to console (for testing). This is different from AuditLog."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "20, "
	Section: "3.2; 5.1.1"
	Z_schema: "AuditLog"

class
	LOGGER

create
	make

feature --{NONE}

	make (clock_: CLOCK)
		do
			clock := clock_
			start_time := clock_.now
			create statistics.make
			create logs.make
			add_log ("Logger has been initialized")
		end

feature

	add_log (st: STRING)
			-- AddElementsToLog
		local
			current_time: DATE_TIME
			new_record: LOG_ELEMENT
		do
			current_time := clock.now
			create new_record.make (current_time)
				-- TODO: Add all the other data: user, action etc.
			logs.add_log_record (new_record)
				-- TODO: Remove printing to the console.
			print (clock.formatted_date_time + ": " + st + "%N")
		end

	archive_logs
			-- ArchiveLog
		do
			logs.archive
		ensure

			logs.is_empty
		end

feature {NONE} -- System statistic

	start_time: DATE_TIME
			-- Time when the system has started

	statistics: STATISTICS

feature {NONE} -- Implementation

	clock: CLOCK

	logs: LOG

end
