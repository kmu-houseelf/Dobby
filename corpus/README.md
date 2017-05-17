# Json Protocol

Describe protocol parameter.
All parameters begin with an uppercase letter.

[Tasktype] 
- define task command type  
- 1. Homeiot, 2. Secretary, 3. Chatbot, 0. Unknown(default)

[Pattern]
- pattern matching number will be inserted

[Tts]
- task result to speak for user 

[Homeiot]
- task for home smart device 

[Homeiot][Homeiottype]
- define home iot task command type
- 1. light, 2. tv, 0. unknown(default)

[Homeiot][Light]
- Objects with parameters of smart light
- (Full command condition) Location, object, action These three parameters must be determined.

[Homeiot][Light][Location]
- location for light smart device 

[Homeiot][Light][Object]
- object name for light smart device

[Homeiot][Light][Action]
- Parameters responsible for powering the light
- True : power on, False : power off

[Homeiot][Light][Brightness]
- Parameters responsible for brightness of light
- True : brighter, False : darker

[Homeiot][Tv]
- Objects with parameters of smart Tv
- (Full command condition) Power, channel, volume, mute One of these four parameters must be determined.

[Homeiot][Tv][Power]
- Parameters responsible for powering the Tv
- True : power on, False : power off

[Homeiot][Tv][Channel]
- Parameters to determine the tv channel number

[Homeiot][Tv][Volume]
- Parameters for adjusting the volume of the Tv
- True : volume up, False : volumn down

[Homeiot][Tv][Mute]
- Tv mute parameter
- True : Mute on, False : Mute off

[Homeiot][Tv][Remoteloc]
- Parameters used when you want to locate the remote control
- True : remote control will be changed red
- False : nothing changed

[Secretary]
- Parameters responsible for the secretary part

[Secretary][Secretarytype]
- Parameters for determining the type of secretary command
- 1. schedule, 2. music, 0.unknown

[Secretary][Schedule]
- Parameters for scheduling

[Secretary][Schedule][Startdate]
- Indicates the calendar start date

[Secretary][Schedule][Starttime]
- Indicates the calendar start time

[Secretary][Schedule][Enddate]
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

[Secretary][Music][Dtlgnr]
- A parameter indicating the detail genre of the music
