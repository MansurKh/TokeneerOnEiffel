note
	description: "Summary description for {STATISTICS}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "21"
	Z_schema: "Stats"
	Section: "3.14"

class
	STATISTICS

create
	make

feature

	make
		do
			entry_count := 0
			failed_entry_count := 0
			successful_bio_check_count := 0
			failed_bio_check_count := 0
		ensure
			entry_count = 0
			failed_entry_count = 0
			successful_bio_check_count = 0
			failed_bio_check_count = 0
		end

feature

	entry_count: INTEGER

	failed_entry_count: INTEGER

	successful_bio_check_count: INTEGER

	failed_bio_check_count: INTEGER

invariant
	entry_count_non_negative: entry_count >= 0
	entry_failed_count_non_negative: failed_entry_count >= 0
	entry_count_non_negative: successful_bio_check_count >= 0
	bio_check_failed_count_non_negative: failed_bio_check_count >= 0

end
