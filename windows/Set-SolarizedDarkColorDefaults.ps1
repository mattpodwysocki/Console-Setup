# Host
$Host.PrivateData.ErrorForeGroundColor = 'Red'
$Host.PrivateData.WarningForeGroundColor = 'Yellow'
$Host.PrivateData.DebugForeGroundColor = 'Green'
$Host.PrivateData.VerboseForeGroundColor = 'Blue'
$Host.PrivateData.ProgressForeGroundColor = 'Gray'

# Host Background
$Host.PrivateData.ErrorBackgroundColor = 'DarkGray'
$Host.PrivateData.WarningBackgroundColor = 'DarkGray'
$Host.PrivateData.DebugBackgroundColor = 'DarkGray'
$Host.PrivateData.VerboseBackgroundColor = 'DarkGray'
$Host.PrivateData.ProgressBackgroundColor = 'Cyan'

# Check for PSReadline
if (Get-Module -ListAvailable -Name "PSReadline") {
    $options = Get-PSReadlineOption

    $options.CommandColor = 'Yellow'
    $options.ContinuationPromptColor = 'DarkBlue'
    $options.DefaultTokenColor = 'DarkBlue'
    $options.EmphasisColor = 'Cyan'
    $options.ErrorColor = 'Red'
    $options.KeywordColor = 'Green'
    $options.MemberColor = 'DarkCyan'
    $options.NumberColor = 'DarkCyan'
    $options.OperatorColor = 'DarkGreen'
    $options.ParameterColor = 'DarkGreen'
    $options.StringColor = 'Blue'
    $options.TypeColor = 'DarkYellow'
    $options.VariableColor = 'Green'
}
