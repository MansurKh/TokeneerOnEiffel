note
	description: "[
		{ID_GENERATOR} is used in all decendents of class {BASIC_TYPES} to assign a unique integer number 
		to arributes of those classes (to use those attibutes as kind of Enum)
	]"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "16"
	Section: "2.7.1"

class
	ID_GENERATOR

create
	make

feature {NONE} -- Initialization

	make
		note
			status: creator
		do
			i := 1
			is_active := True
		ensure
			starts_with_1: i = 1
			is_active
		end

feature

	is_active: BOOLEAN

feature

	new_id: INTEGER
		require
			is_active
		do
			Result := i
			if i < {INTEGER}.max_value then
				increase_i
			else
				is_active := False
			end
		ensure
			true_result: Result = old i
			i_in_bounds: i <= {INTEGER}.max_value
			increased: old i < {INTEGER}.max_value implies i = old i + 1
			deactivated: old i = {INTEGER}.max_value implies not is_active
		end

feature {NONE} -- implementation

	i: INTEGER

	increase_i
		require
			i < {INTEGER}.max_value
		do
			i := i + 1
		ensure
			increased_by_1: i = old i + 1
		end

invariant
	new_id_in_bounds: i >= 1 and i <= {INTEGER}.max_value

end
