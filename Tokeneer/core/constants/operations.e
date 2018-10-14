note
	description: "[
		{OPERATIONS} contains administrative operations supprted by TIS: archive log, update configuration, override doorlock and shut down
	]"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "21"
	Section: "3.5"

class
	OPERATIONS

inherit

	BASIC_TYPE
		rename
			possible_values as supported_operations
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make (id_generator: ID_GENERATOR)
		do
			precursor (id_generator)
			elem_count := 4 -- Four operations are supported
			create str_operation_map.make (elem_count)
			str_operation_map.extend (archive_log, "archive log")
			str_operation_map.extend (update_configuration, "update configuration")
			str_operation_map.extend (override_doorlock, "override doorlock")
			str_operation_map.extend (shut_down, "shut down")
		end

feature -- Values

	archive_log: INTEGER
			-- Code for  `archive_log' operation
		once
			Result := id.new_id
		end

	update_configuration: INTEGER
			-- Code for `update_configuration' operation
		once
			Result := id.new_id
		end

	override_doorlock: INTEGER
			-- Code for `override_doorlock' operation
		once
			Result := id.new_id
		end

	shut_down: INTEGER
			-- Code for `shut_down' operation
		once
			Result := id.new_id
		end

feature -- Query

	supported_operations: SET [INTEGER]
			-- Set of supported administrative operations
		once
			create {LINKED_SET [INTEGER]} Result.make
			across
				str_operation_map.current_keys as keys
			loop
				Result.extend (str_operation_map.at (keys.item))
			end
		ensure then
			Result.has (archive_log)
			Result.has (update_configuration)
			Result.has (override_doorlock)
			Result.has (shut_down)
		end

	is_input_valid (v: STRING): BOOLEAN
			-- is the string entered by the admin valid operation
		do
			Result := str_operation_map.has (v)
		ensure
			Result = str_operation_map.has (v)
		end

	get_operation (v: STRING): INTEGER
			-- get specific operation code
		require
			not v.is_empty
		do
			if attached str_operation_map.at (v) as command then
				Result := command
			else
				Result := 0
			end
		ensure
			str_operation_map.has (v) implies Result = str_operation_map.at (v)
			not str_operation_map.has (v) implies Result = 0
		end

feature {NONE} -- Implementation

	str_operation_map: HASH_TABLE [INTEGER, STRING]
			-- map of input typed by administrator to a certain operation code

end
