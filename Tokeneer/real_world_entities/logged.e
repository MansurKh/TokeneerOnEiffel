note
	description: "{LOGGED} contains features to log the actions. Used for all classes whose actions of should be logged"
	author: "Mansur Khazeev"
	EIS: "protocol=URI", "src=https://github.com/MansurKh/TokeneerOnEiffel/blob/master/specification/SpecZ.pdf"
	page: "35"
	Section: "5.1.4"
	Z_schema: "AuditDoor, AuditLatch, AuditAlarm, AuditLogAlarm, AuditDisplay, AuditScreen"

deferred class
	LOGGED

feature {NONE}

	initialize_logger (clock_: CLOCK)
		do
			create logger.make (clock_)
		end

	set_up_logger (logger_: LOGGER)
		do
			logger := logger_
		end

feature {NONE}

	logger: LOGGER

end
