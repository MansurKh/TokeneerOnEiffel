note
	description: "User who has ability to issue certificates"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "9"
	Section: "2.4"

class
	ISSUER

inherit

	USER

create
	make

feature

		--	issue_certificate: CERTIFICATE
		--		do

		--			create {PRIVILEDGE_CERTIFICATE} Result.make (Current, begining, ending: TIME)
		--		end

end
