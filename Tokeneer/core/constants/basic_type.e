note
	description: "Summary description for {BASIC_TYPE}."
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "8"
	Section: "2.4"

deferred class
	BASIC_TYPE

feature {NONE} -- Initialization

	make (id_generator: ID_GENERATOR)
		do
			id := id_generator
		ensure
			id_generator_assigned: id = id_generator
		end

feature -- Query

	possible_values: SET [INTEGER]
		deferred
		ensure
			not Result.is_empty
		end

feature {NONE} -- Implementation

	elem_count: INTEGER = 8

	id: ID_GENERATOR

end
