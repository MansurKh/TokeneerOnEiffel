note
	description: "{STATISTICS} are data updated as actions that are being monitored for the statistics occur."
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

	add_entry
		do
			entry_count := entry_count + 1
		ensure
			entry_count = old entry_count + 1
				-- Z-schema: AddSuccessfulEntryToStats
		end

	add_failed_entry
		do
			failed_entry_count := failed_entry_count + 1
		ensure
			failed_entry_count = old failed_entry_count + 1
				-- Z-schema: AddFailedEntryToStats
		end

	add_successful_bio_check
		do
			successful_bio_check_count := successful_bio_check_count + 1
		ensure
			successful_bio_check_count = old successful_bio_check_count + 1
				-- Z-schema: AddSuccessfulBioCheckToStats
		end

	add_failed_bio_check
		do
			failed_bio_check_count := failed_bio_check_count + 1
		ensure
			failed_bio_check_count = old failed_bio_check_count + 1
				-- Z-schema: AddFailedBioCheckToStats
		end

feature -- Access

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
