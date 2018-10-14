note
	description: "{LOG} consists of a number of log elements."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "20"
	Z_schema: "AuditLog"
	Section: "3.2"

class
	LOG

create
	make

feature

	make
		do
			create records.make
		ensure
			records.is_empty
		end

feature -- Attributes

	size: INTEGER

feature -- Queries

	is_empty: BOOLEAN
		do
			Result := records.is_empty
		ensure
			Result = records.is_empty
		end

	oldest_log_time: DATE_TIME
		require
			not is_empty
		do
			Result := records.last.time_stamp
		ensure
			Result = records.last.time_stamp
		end

	newest_log_time: DATE_TIME
		require
			not is_empty
		do
			Result := records.first.time_stamp
		ensure
			Result = records.first.time_stamp
		end

feature

	add_log_record (rec: LOG_ELEMENT)
		do
			records.put_front (rec)
		ensure
			records.first = rec
			records.count = old records.count + 1
		end

	archive
			-- ArchiveLog
		local
			output_file: PLAIN_TEXT_FILE
		do
			create output_file.make_open_write (oldest_log_time.formatted_out (date_time_format) + file_extention)
			across
				records as r
			loop
				output_file.put_string (r.item.out)
			end
			output_file.close
		end

feature {NONE} -- Helper

	correct_logs_size: INTEGER
		do
			Result := 0
			across
				records as r
			loop
				Result := Result + r.item.size
			end
		end

feature {NONE} -- Implementation

	records: LINKED_LIST [LOG_ELEMENT]

	date_time_format: STRING = "YYYYMMMDDHH[0]mi[0]ss"
			-- format of the archive filename

	file_extention: STRING = ".txt"

invariant
	oldest: across records as r all r.item.time_stamp >= oldest_log_time end
	newest: across records as r all r.item.time_stamp <= newest_log_time end
	chronological_order: across 2 |..| records.count as i all records [i.item].time_stamp <= records [i.item - 1].time_stamp end
	size_of_log: not is_empty implies correct_logs_size = size
	empty: is_empty implies size = 0

end
