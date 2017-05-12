# Json Protocol

Describe protocol parameter.
All parameters begin with an uppercase letter.

[TaskNumber] 
- define task command type  
- 1. HomeIOT, 2. Secretary, 3. Chatbot, 0. Unknown(default)

[TTS]
- task result to speak for user 

[HomeIOT]
- task for home smart device 

[HomeIOT][HomeIOTType]
- define home iot task command type
- 1. light, 2. tv, 0. unknown(default)

[HomeIOT][Light]
- Objects with parameters of smart light
- (Full command condition) Location, object, action These three parameters must be determined.

[HomeIOT][Light][Location]
- location for light smart device 

[HomeIOT][Light][Object]
- object name for light smart device

[HomeIOT][Light][Action]
- Parameters responsible for powering the light
- True : power on, False : power off

[HomeIOT][Light][Brightness]
- Parameters responsible for brightness of light
- True : brighter, False : darker

[HomeIOT][TV]
- Objects with parameters of smart TV
- (Full command condition) Power, channel, volume, mute One of these four parameters must be determined.

[HomeIOT][TV][Power]
- Parameters responsible for powering the TV
- True : power on, False : power off

[HomeIOT][TV][Channel]
- Parameters to determine the tv channel number

[HomeIOT][TV][Volume]
- Parameters for adjusting the volume of the TV
- True : volume up, False : volumn down

[HomeIOT][TV][Mute]
- Tv mute parameter
- True : Mute on, False : Mute off

[HomeIOT][TV][RemoteLoc]
- Parameters used when you want to locate the remote control
- True : remote control will be changed red
- False : nothing changed

[Secretary]
- Parameters responsible for the secretary part

[Secretary][SecretaryType]
- Parameters for determining the type of secretary command
- 1. schedule, 2. music, 0.unknown

[Secretary][Schedule]
- Parameters for scheduling

[Secretary][Schedule][StartDate]
- Indicates the calendar start date

[Secretary][Schedule][StartTime]
- Indicates the calendar start time

[Secretary][Schedule][EndDate]
- Indicates the calendar end date

[Secretary][Schedule][Content]
- Indicates the calendar end time

[Secretary][Music]
- Objects with music playback related parameters

[Secretary][Music][Title]
- A parameter indicating the title of the music

[Secretary][Music][Singer]
- A parameter indicating the singer of the music

[Secretary][Music][Album]
- A parameter indicating the album of the music

[Secretary][Music][Gnr]
- A parameter indicating the genre of the music

[Secretary][Music][DtlGnr]
- A parameter indicating the detail genre of the music
