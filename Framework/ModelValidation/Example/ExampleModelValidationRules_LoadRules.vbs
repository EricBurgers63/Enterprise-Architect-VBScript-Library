'[path=\Framework\ModelValidation\Example]
'[group=ModelValidationExample]
'
'Delete the <DISABLED> below to enable EA-Matic for this Example 
'<DISABLED>EA-Matic
'<DISABLED>EA-Matic: http://bellekens.com/ea-matic/

option explicit 

!INC Local Scripts.EAConstants-VBScript
!INC Logging.Logger
!INC Logging.LogManager
' 
' ModelValidation.ExampleModelValidationRuleConstants
' does not need to be included here.
' See README.md for more details.
' The creating of the category and rules is done separately to
' creating the constants used by the rules themselves.
' This problem is caused by EA-Matic and scripts being reset every 5 minutes.
'

dim logger
set logger = new LoggerClass
logger.init "ExampleModelValidationRules_LoadRules"

' This should be
' function EA_OnInitializeUserRules()
' but that function never receives events.
' Using EA_FileOpen isntead
function EA_FileOpen()
	Logger.debug "EA_OnInitializeUserRules called"

	dim project as EA.Project
	dim exampleCategoryId, exampleRuleOneId
	
	set project = Repository.GetProjectInterface()
	exampleCategoryId = project.DefineRuleCategory("Example Category")
	Logger.debug "EA_OnInitializeUserRules exampleCategoryId =" & exampleCategoryId
	
	' The second parameter uses EnumMVErrorType values which are defined in Local Scripts.EAConstants-VBScript
	' and are mvError, mvWarning, mvInformation, mvErrorCritical.
	' The third paramter is a string for the error message.
	' Both these values are provided in Project.PublishResult so why are they also needed here? 
	exampleRuleOneId = project.DefineRule(exampleCategoryId, mvError, "Example Rule 01")
	Logger.debug "EA_OnInitializeUserRules exampleRuleOneId =" & exampleRuleOneId

end function