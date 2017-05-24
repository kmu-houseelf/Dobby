
(* define morph pattern *)
SecretaryFoodAction = Apply[Alternatives, {"뭐먹을", "추천"}]
HomeiotLightBrightnessFalse = Apply[Alternatives, {"어둡게"}]
HomeiotAirconSub = Apply[Alternatives, {"온도"}]
HomeiotMusicSinger = Apply[Alternatives, {"아이유", "이적"}]
HomeiotTvObject = Apply[Alternatives, {"TV", "Tv", "tv", "티비", "텔레비", "테레비"}]
HomeiotLightBrightnessTrue = Apply[Alternatives, {"밝게"}]
HomeiotAirconPowerFalse = Apply[Alternatives, {"꺼", "끌", "끄", "오프"}]
HomeiotLightObject = Apply[Alternatives, {"불", "조명", "등", "형광등", "조명등"}]
HomeiotTvMuteTrue = Apply[Alternatives, {"음소거해", "음소거하", "음소거할", "음소거킬", "음소거켜", "음소거켤"}]
HomeiotTvChannel = Apply[Alternatives, {"메뉴", "카테고리", "0번", "1번", "2번", "3번", "4번", "5번", "6번", "7번", "8번", "9번", "ytn", "sbs", "cnn", "해외축구", "야구", "해외농구", "음악프로", "애니프로", "게임프로", "교육프로", "YTN", "Ytn", "SBS", "CNN", "Cnn", "축구", "농구", "음악프로그램", "만화", "애니메이션", "애니메이션프로그램", "애니메이션프로", "게임", "게임프로그램", "교육채널", "교육프로그램", "EBS", "ebs"}]
HomeiotMusicActionTrue = Apply[Alternatives, {"음악틀어", "노래틀어", "곡틀어", "틀어"}]
HomeiotLightActionFalse = Apply[Alternatives, {"끄", "끌", "꺼"}]
HomeiotMusicGnr = Apply[Alternatives, {"가요", "OST"}]
HomeiotLightActionTrue = Apply[Alternatives, {"킬", "켤", "켜"}]
HomeiotAirconActionFalse = Apply[Alternatives, {"낮", "내"}]
HomeiotLightLocation = Apply[Alternatives, {"거실", "마루", "방", "화장실", "욕실", "부엌", "주방", "전체"}]
HomeiotAirconActionTrue = Apply[Alternatives, {"높", "올"}]
HomeiotAirconTemperature = Apply[Alternatives, {"도"}]
HomeiotTvPowerTrue = Apply[Alternatives, {"킬", "켤", "켜", "바꿔", "바꾸", "바꿀", "틀", "온", "돌려", "돌리", "보여", "봐봐", "알려", "알리", "변경"}]
HomeiotTvVolumeFalse = Apply[Alternatives, {"소리줄", "소리낮", "볼륨줄", "볼륨낮", "음량낮", "음량줄"}]
HomeiotTvOption = Apply[Alternatives, {"채널", "번호"}]
HomeiotTvComponent = Apply[Alternatives, {"리모컨", "리모콘"}]
HomeiotMusicActionFalse = Apply[Alternatives, {"음악꺼줘", "노래꺼줘", "곡꺼줘"}]
HomeiotTvPowerFalse = Apply[Alternatives, {"끄", "끌", "꺼", "오프"}]
HomeiotAirconObject = Apply[Alternatives, {"에어컨", "보일러"}]
HomeiotMusicTitle = Apply[Alternatives, {"밤편지", "걱정말아요그대"}]
HomeiotTvMuteFalse = Apply[Alternatives, {"음소거끄", "음소거끌", "음소거꺼"}]
HomeiotTvVolumeTrue = Apply[Alternatives, {"소리킬", "소리켜", "소리켤", "소리높", "볼륨킬", "볼륨켜", "볼륨켤", "볼륨높", "음량높", "음량올"}]
HomeiotTvRemotelocTrue = Apply[Alternatives, {"알려", "어딨", "어디", "찾아"}]
HomeiotAirconPowerTrue = Apply[Alternatives, {"켜", "킬", "켤", "온", "틀", "해줘"}]
SecretaryFoodObject = Apply[Alternatives, {"아침", "점심", "저녁", "음식"}]

(* define mapping *)
SecretaryFoodActionMapping = {"뭐먹을"->"act", "추천"-> "act"}
HomeiotLightBrightnessFalseMapping = #->False&/@{"어둡게"}
HomeiotAirconSubMapping = {"온도"->"temp"}
HomeiotMusicSingerMapping = {"아이유"->"IU", "이적"-> "LEE_JUK"}
HomeiotTvObjectMapping = {"TV"->"TV", "Tv"-> "TV", "tv"-> "TV", "티비"-> "TV", "텔레비"-> "TV", "테레비"-> "TV"}
HomeiotLightBrightnessTrueMapping = #->True&/@{"밝게"}
HomeiotAirconPowerFalseMapping = #->False&/@{"꺼", "끌", "끄", "오프"}
HomeiotLightObjectMapping = {"불"->"Lamp", "조명"-> "Lamp", "등"-> "Lamp", "형광등"-> "Lamp", "조명등"-> "Lamp"}
HomeiotTvMuteTrueMapping = #->True&/@{"음소거해", "음소거하", "음소거할", "음소거킬", "음소거켜", "음소거켤"}
HomeiotTvChannelMapping = {"메뉴"->"10", "카테고리"-> "10", "0번"-> "0", "1번"-> "1", "2번"-> "2", "3번"-> "3", "4번"-> "4", "5번"-> "5", "6번"-> "6", "7번"-> "7", "8번"-> "8", "9번"-> "9", "ytn"-> "0", "sbs"-> "1", "cnn"-> "2", "해외축구"-> "3", "야구"-> "4", "해외농구"-> "5", "음악프로"-> "6", "애니프로"-> "7", "게임프로"-> "8", "교육프로"-> "9", "YTN"-> "0", "Ytn"-> "0", "SBS"-> "1", "CNN"-> "2", "Cnn"-> "2", "축구"-> "3", "농구"-> "5", "음악프로그램"-> "6", "만화"-> "7", "애니메이션"-> "7", "애니메이션프로그램"-> "7", "애니메이션프로"-> "7", "게임"-> "8", "게임프로그램"-> "8", "교육채널"-> "9", "교육프로그램"-> "9", "EBS"-> "9", "ebs"-> "9"}
HomeiotMusicActionTrueMapping = #->True&/@{"음악틀어", "노래틀어", "곡틀어", "틀어"}
HomeiotLightActionFalseMapping = #->False&/@{"끄", "끌", "꺼"}
HomeiotMusicGnrMapping = {"가요"->"Song", "OST"-> "OST"}
HomeiotLightActionTrueMapping = #->True&/@{"킬", "켤", "켜"}
HomeiotAirconActionFalseMapping = #->False&/@{"낮", "내"}
HomeiotLightLocationMapping = {"거실"->"Livingroom", "마루"-> "Livingroom", "방"-> "Room", "화장실"-> "Bathroom", "욕실"-> "Bathroom", "부엌"-> "Kitchen", "주방"-> "Kitchen", "전체"-> "All"}
HomeiotAirconActionTrueMapping = #->True&/@{"높", "올"}
HomeiotAirconTemperatureMapping = {"도"->"do"}
HomeiotTvPowerTrueMapping = #->True&/@{"킬", "켤", "켜", "바꿔", "바꾸", "바꿀", "틀", "온", "돌려", "돌리", "보여", "봐봐", "알려", "알리", "변경"}
HomeiotTvVolumeFalseMapping = #->False&/@{"소리줄", "소리낮", "볼륨줄", "볼륨낮", "음량낮", "음량줄"}
HomeiotTvOptionMapping = {"채널"->"Channel", "번호"-> "Channel"}
HomeiotTvComponentMapping = {"리모컨"->"Remotecontrol", "리모콘"-> "Remotecontrol"}
HomeiotMusicActionFalseMapping = #->False&/@{"음악꺼줘", "노래꺼줘", "곡꺼줘"}
HomeiotTvPowerFalseMapping = #->False&/@{"끄", "끌", "꺼", "오프"}
HomeiotAirconObjectMapping = {"에어컨"->"aircon", "보일러"-> "aircon"}
HomeiotMusicTitleMapping = {"밤편지"->"Through_The_Night", "걱정말아요그대"-> "Don't_worry_dear"}
HomeiotTvMuteFalseMapping = #->False&/@{"음소거끄", "음소거끌", "음소거꺼"}
HomeiotTvVolumeTrueMapping = #->True&/@{"소리킬", "소리켜", "소리켤", "소리높", "볼륨킬", "볼륨켜", "볼륨켤", "볼륨높", "음량높", "음량올"}
HomeiotTvRemotelocTrueMapping = #->True&/@{"알려", "어딨", "어디", "찾아"}
HomeiotAirconPowerTrueMapping = #->True&/@{"켜", "킬", "켤", "온", "틀", "해줘"}
SecretaryFoodObjectMapping = {"아침"->"food", "점심"-> "food", "저녁"->"food", "음식"->"food"}

(* define sentence pattern *)
SentencePattern1 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotaircontemperature:HomeiotAirconTemperature~~t3:___~~homeiotairconactionfalse:HomeiotAirconActionFalse~~t4:___
SentencePattern2 = t1:___~~"Q44"~~t2:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t3:___
SentencePattern3 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvoption:HomeiotTvOption~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern4 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~t4:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t5:___
SentencePattern5 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___
SentencePattern6 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~t3:___
SentencePattern7 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___~~homeiottvoption:HomeiotTvOption~~t4:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t5:___
SentencePattern8 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotairconsub:HomeiotAirconSub~~t3:___~~homeiotaircontemperature:HomeiotAirconTemperature~~t4:___~~homeiotairconactiontrue:HomeiotAirconActionTrue~~t5:___
SentencePattern9 = t1:___~~homeiottvoption:HomeiotTvOption~~t2:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t3:___
SentencePattern10 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~t3:___
SentencePattern11 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern12 = t1:___~~"Q51"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern13 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t3:___~~homeiotlightlocation:HomeiotLightLocation~~t4:___
SentencePattern14 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotaircontemperature:HomeiotAirconTemperature~~t3:___~~homeiotairconpowertrue:HomeiotAirconPowerTrue~~t4:___
SentencePattern15 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t3:___
SentencePattern16 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvmutetrue:HomeiotTvMuteTrue~~t3:___
SentencePattern17 = t1:___~~homeiotmusicsinger:HomeiotMusicSinger~~t2:___~~homeiotmusictitle:HomeiotMusicTitle~~t3:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t4:___
SentencePattern18 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~t3:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t4:___
SentencePattern19 = t1:___~~homeiotmusictitle:HomeiotMusicTitle~~t2:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t3:___
SentencePattern20 = t1:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t2:___
SentencePattern21 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvpowerfalse:HomeiotTvPowerFalse~~t3:___
SentencePattern22 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t4:___
SentencePattern23 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotairconpowerfalse:HomeiotAirconPowerFalse~~t3:___
SentencePattern24 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotairconpowertrue:HomeiotAirconPowerTrue~~t3:___
SentencePattern25 = t1:___~~homeiottvcomponent:HomeiotTvComponent~~t2:___~~homeiottvremoteloctrue:HomeiotTvRemotelocTrue~~t3:___
SentencePattern26 = t1:___~~"Q42"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern27 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~t4:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t5:___
SentencePattern28 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t3:___
SentencePattern29 = t1:___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~t2:___
SentencePattern30 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~t3:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t4:___
SentencePattern31 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t4:___
SentencePattern32 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~t3:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t4:___~~homeiotlightlocation:HomeiotLightLocation~~t5:___
SentencePattern33 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvmutefalse:HomeiotTvMuteFalse~~t3:___
SentencePattern34 = t1:___~~homeiottvchannel:HomeiotTvChannel~~t2:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t3:___
SentencePattern35 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotairconsub:HomeiotAirconSub~~t3:___~~homeiotaircontemperature:HomeiotAirconTemperature~~t4:___~~homeiotairconpowertrue:HomeiotAirconPowerTrue~~t5:___
SentencePattern36 = t1:___~~"Q53"~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___
SentencePattern37 = t1:___~~homeiottvmutetrue:HomeiotTvMuteTrue~~t2:___
SentencePattern38 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvcomponent:HomeiotTvComponent~~t3:___~~homeiottvremoteloctrue:HomeiotTvRemotelocTrue~~t4:___
SentencePattern39 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t3:___~~homeiotlightlocation:HomeiotLightLocation~~t4:___
SentencePattern40 = t1:___~~homeiottvmutefalse:HomeiotTvMuteFalse~~t2:___
SentencePattern41 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotairconsub:HomeiotAirconSub~~t3:___~~homeiotaircontemperature:HomeiotAirconTemperature~~t4:___~~homeiotairconactionfalse:HomeiotAirconActionFalse~~t5:___
SentencePattern42 = t1:___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~t2:___
SentencePattern43 = t1:___~~homeiotmusicgnr:HomeiotMusicGnr~~t2:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t3:___
SentencePattern44 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvoption:HomeiotTvOption~~t3:___~~homeiottvchannel:HomeiotTvChannel~~t4:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t5:___
SentencePattern45 = t1:___~~"Q55"~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___
SentencePattern46 = t1:___~~homeiotmusicsinger:HomeiotMusicSinger~~t2:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t3:___
SentencePattern47 = t1:___~~homeiottvoption:HomeiotTvOption~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern48 = t1:___~~"Q47"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern49 = t1:___~~"Q49"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern50 = t1:___~~homeiottvchannel:HomeiotTvChannel~~t2:___~~homeiottvoption:HomeiotTvOption~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern51 = t1:___~~homeiotairconobject:HomeiotAirconObject~~t2:___~~homeiotaircontemperature:HomeiotAirconTemperature~~t3:___~~homeiotairconactiontrue:HomeiotAirconActionTrue~~t4:___
SentencePattern52 = t1:___~~secretaryfoodobject:SecretaryFoodObject~~t2:___~~secretaryfoodaction:SecretaryFoodAction~~t3:___
SentencePattern53 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t3:___
SentencePattern54 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~t3:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t4:___~~homeiotlightlocation:HomeiotLightLocation~~t5:___
SentencePattern55 = t1:___~~homeiotmusicactionfalse:HomeiotMusicActionFalse~~t2:___
SentencePattern56 = t1:___~~"Q44"~~t2:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t3:___

(* define sentence parameter *)
SentenceParameter1 = {homeiotairconobject,homeiotaircontemperature,homeiotairconactionfalse,t1,t2,t3,t4}
SentenceParameter2 = {homeiotlightactionfalse,t1,t2,t3}
SentenceParameter3 = {homeiottvobject,homeiottvoption,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter4 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,t1,t2,t3,t4,t5}
SentenceParameter5 = {homeiotlightlocation,homeiotlightobject,t1,t2,t3}
SentenceParameter6 = {homeiottvobject,homeiottvvolumefalse,t1,t2,t3}
SentenceParameter7 = {homeiottvobject,homeiottvchannel,homeiottvoption,homeiottvpowertrue,t1,t2,t3,t4,t5}
SentenceParameter8 = {homeiotairconobject,homeiotairconsub,homeiotaircontemperature,homeiotairconactiontrue,t1,t2,t3,t4,t5}
SentenceParameter9 = {homeiottvoption,homeiottvpowertrue,t1,t2,t3}
SentenceParameter10 = {homeiottvobject,homeiottvvolumetrue,t1,t2,t3}
SentenceParameter11 = {homeiottvobject,homeiottvchannel,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter12 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter13 = {homeiotlightobject,homeiotlightactionfalse,homeiotlightlocation,t1,t2,t3,t4}
SentenceParameter14 = {homeiotairconobject,homeiotaircontemperature,homeiotairconpowertrue,t1,t2,t3,t4}
SentenceParameter15 = {homeiottvobject,homeiottvpowertrue,t1,t2,t3}
SentenceParameter16 = {homeiottvobject,homeiottvmutetrue,t1,t2,t3}
SentenceParameter17 = {homeiotmusicsinger,homeiotmusictitle,homeiotmusicactiontrue,t1,t2,t3,t4}
SentenceParameter18 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,t1,t2,t3,t4}
SentenceParameter19 = {homeiotmusictitle,homeiotmusicactiontrue,t1,t2,t3}
SentenceParameter20 = {homeiotmusicactiontrue,t1,t2}
SentenceParameter21 = {homeiottvobject,homeiottvpowerfalse,t1,t2,t3}
SentenceParameter22 = {homeiotlightlocation,homeiotlightobject,homeiotlightactionfalse,t1,t2,t3,t4}
SentenceParameter23 = {homeiotairconobject,homeiotairconpowerfalse,t1,t2,t3}
SentenceParameter24 = {homeiotairconobject,homeiotairconpowertrue,t1,t2,t3}
SentenceParameter25 = {homeiottvcomponent,homeiottvremoteloctrue,t1,t2,t3}
SentenceParameter26 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter27 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,t1,t2,t3,t4,t5}
SentenceParameter28 = {homeiotlightobject,homeiotlightactionfalse,t1,t2,t3}
SentenceParameter29 = {homeiottvvolumefalse,t1,t2}
SentenceParameter30 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,t1,t2,t3,t4}
SentenceParameter31 = {homeiotlightlocation,homeiotlightobject,homeiotlightactiontrue,t1,t2,t3,t4}
SentenceParameter32 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,homeiotlightlocation,t1,t2,t3,t4,t5}
SentenceParameter33 = {homeiottvobject,homeiottvmutefalse,t1,t2,t3}
SentenceParameter34 = {homeiottvchannel,homeiottvpowertrue,t1,t2,t3}
SentenceParameter35 = {homeiotairconobject,homeiotairconsub,homeiotaircontemperature,homeiotairconpowertrue,t1,t2,t3,t4,t5}
SentenceParameter36 = {homeiottvchannel,t1,t2,t3}
SentenceParameter37 = {homeiottvmutetrue,t1,t2}
SentenceParameter38 = {homeiottvobject,homeiottvcomponent,homeiottvremoteloctrue,t1,t2,t3,t4}
SentenceParameter39 = {homeiotlightobject,homeiotlightactiontrue,homeiotlightlocation,t1,t2,t3,t4}
SentenceParameter40 = {homeiottvmutefalse,t1,t2}
SentenceParameter41 = {homeiotairconobject,homeiotairconsub,homeiotaircontemperature,homeiotairconactionfalse,t1,t2,t3,t4,t5}
SentenceParameter42 = {homeiottvvolumetrue,t1,t2}
SentenceParameter43 = {homeiotmusicgnr,homeiotmusicactiontrue,t1,t2,t3}
SentenceParameter44 = {homeiottvobject,homeiottvoption,homeiottvchannel,homeiottvpowertrue,t1,t2,t3,t4,t5}
SentenceParameter45 = {homeiottvchannel,t1,t2,t3}
SentenceParameter46 = {homeiotmusicsinger,homeiotmusicactiontrue,t1,t2,t3}
SentenceParameter47 = {homeiottvoption,homeiottvchannel,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter48 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter49 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter50 = {homeiottvchannel,homeiottvoption,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter51 = {homeiotairconobject,homeiotaircontemperature,homeiotairconactiontrue,t1,t2,t3,t4}
SentenceParameter52 = {secretaryfoodobject,secretaryfoodaction,t1,t2,t3}
SentenceParameter53 = {homeiotlightobject,homeiotlightactiontrue,t1,t2,t3}
SentenceParameter54 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,homeiotlightlocation,t1,t2,t3,t4,t5}
SentenceParameter55 = {homeiotmusicactionfalse,t1,t2}
SentenceParameter56 = {homeiotlightactiontrue,t1,t2,t3}

(* define sentence json *)
SentenceJson1[{homeiotairconobject_,homeiotaircontemperature_,homeiotairconactionfalse_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Temperature"] = homeiotaircontemperature/.HomeiotAirconTemperatureMapping;json["Homeiot"]["Aircon"]["Action"] = homeiotairconactionfalse/.HomeiotAirconActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Homeiot"]["Aircon"]["Temperature"] = t2;json["Tts"] = homeiotairconobject~~" 온도를 "~~t2~~"도 낮췄습니다";json["Pattern"]="Null";json]
SentenceJson2[{homeiotlightactionfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Pattern"] = "Null";json["Tts"] = "불 껐습니다";json["Pattern"]="Null";json]
SentenceJson3[{homeiottvobject_,homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 55;json["Tts"] = "어떤 채널로 틀어드릴까요?";json]
SentenceJson4[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson5[{homeiotlightlocation_,homeiotlightobject_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 44;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~" 어떻게 할까요?";json]
SentenceJson6[{homeiottvobject_,homeiottvvolumefalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"볼륨 줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson7[{homeiottvobject_,homeiottvchannel_,homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson8[{homeiotairconobject_,homeiotairconsub_,homeiotaircontemperature_,homeiotairconactiontrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Sub"] = homeiotairconsub/.HomeiotAirconSubMapping;json["Homeiot"]["Aircon"]["Temperature"] = homeiotaircontemperature/.HomeiotAirconTemperatureMapping;json["Homeiot"]["Aircon"]["Action"] = homeiotairconactiontrue/.HomeiotAirconActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Homeiot"]["Aircon"]["Temperature"] = t3;json["Tts"] = homeiotairconobject~~" 온도를 "~~t3~~"도 높였습니다";json["Pattern"]="Null";json]
SentenceJson9[{homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 53;json["Tts"] = "어떤 채널로 틀어드릴까요?";json]
SentenceJson10[{homeiottvobject_,homeiottvvolumetrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"볼륨 높였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson11[{homeiottvobject_,homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson12[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "어둡게 했습니다";json["Pattern"]="Null";json]
SentenceJson13[{homeiotlightobject_,homeiotlightactionfalse_,homeiotlightlocation_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson14[{homeiotairconobject_,homeiotaircontemperature_,homeiotairconpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Temperature"] = homeiotaircontemperature/.HomeiotAirconTemperatureMapping;json["Homeiot"]["Aircon"]["Power"] = homeiotairconpowertrue/.HomeiotAirconPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Homeiot"]["Aircon"]["Temperature"] = t2;json["Tts"] = homeiotairconobject~~" "~~t2~~"도로 켰습니다";json["Pattern"]="Null";json]
SentenceJson15[{homeiottvobject_,homeiottvpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson16[{homeiottvobject_,homeiottvmutetrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"음소거 했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson17[{homeiotmusicsinger_,homeiotmusictitle_,homeiotmusicactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Singer"] = homeiotmusicsinger/.HomeiotMusicSingerMapping;json["Homeiot"]["Music"]["Title"] = homeiotmusictitle/.HomeiotMusicTitleMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusicsinger~~"의"~~homeiotmusictitle~~" 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson18[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 51;json["Tts"] = "어디를 어둡게 해 드릴까요?";json]
SentenceJson19[{homeiotmusictitle_,homeiotmusicactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Title"] = homeiotmusictitle/.HomeiotMusicTitleMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusictitle~~" 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson20[{homeiotmusicactiontrue_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = t1~~" 켜졌습니다";json["Pattern"]="Null";json]
SentenceJson21[{homeiottvobject_,homeiottvpowerfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowerfalse/.HomeiotTvPowerFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson22[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactionfalse_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson23[{homeiotairconobject_,homeiotairconpowerfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Power"] = homeiotairconpowerfalse/.HomeiotAirconPowerFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Tts"] = homeiotairconobject~~" 껏습니다";json["Pattern"]="Null";json]
SentenceJson24[{homeiotairconobject_,homeiotairconpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Power"] = homeiotairconpowertrue/.HomeiotAirconPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Tts"] = homeiotairconobject~~" 켰습니다";json["Pattern"]="Null";json]
SentenceJson25[{homeiottvcomponent_,homeiottvremoteloctrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Component"] = homeiottvcomponent/.HomeiotTvComponentMapping;json["Homeiot"]["Tv"]["Remoteloc"] = homeiottvremoteloctrue/.HomeiotTvRemotelocTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvcomponent~~" "~~"찾았습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson26[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "불 켰습니다";json["Pattern"]="Null";json]
SentenceJson27[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson28[{homeiotlightobject_,homeiotlightactionfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 47;json["Tts"] = "어디를 꺼 드릴까요?";json]
SentenceJson29[{homeiottvvolumefalse_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = "볼륨 줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson30[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 49;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson31[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson32[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,homeiotlightlocation_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson33[{homeiottvobject_,homeiottvmutefalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"음소거 껐습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson34[{homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson35[{homeiotairconobject_,homeiotairconsub_,homeiotaircontemperature_,homeiotairconpowertrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Sub"] = homeiotairconsub/.HomeiotAirconSubMapping;json["Homeiot"]["Aircon"]["Temperature"] = homeiotaircontemperature/.HomeiotAirconTemperatureMapping;json["Homeiot"]["Aircon"]["Power"] = homeiotairconpowertrue/.HomeiotAirconPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Homeiot"]["Aircon"]["Temperature"] = t3;json["Tts"] = homeiotairconobject~~" "~~t3~~"도로 틀었습니다";json["Pattern"]="Null";json]
SentenceJson36[{homeiottvchannel_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = "Null";json["Tts"] = "틀었습니다";json["Pattern"]="Null";json]
SentenceJson37[{homeiottvmutetrue_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = "음소거 했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson38[{homeiottvobject_,homeiottvcomponent_,homeiottvremoteloctrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Component"] = homeiottvcomponent/.HomeiotTvComponentMapping;json["Homeiot"]["Tv"]["Remoteloc"] = homeiottvremoteloctrue/.HomeiotTvRemotelocTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvcomponent~~" "~~"찾았습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson39[{homeiotlightobject_,homeiotlightactiontrue_,homeiotlightlocation_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson40[{homeiottvmutefalse_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = "음소거 껐습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson41[{homeiotairconobject_,homeiotairconsub_,homeiotaircontemperature_,homeiotairconactionfalse_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Sub"] = homeiotairconsub/.HomeiotAirconSubMapping;json["Homeiot"]["Aircon"]["Temperature"] = homeiotaircontemperature/.HomeiotAirconTemperatureMapping;json["Homeiot"]["Aircon"]["Action"] = homeiotairconactionfalse/.HomeiotAirconActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Homeiot"]["Aircon"]["Temperature"] = t3;json["Tts"] = homeiotairconobject~~" 온도를 "~~t3~~"도 낮췄습니다";json["Pattern"]="Null";json]
SentenceJson42[{homeiottvvolumetrue_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = "볼륨 높였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson43[{homeiotmusicgnr_,homeiotmusicactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Gnr"] = homeiotmusicgnr/.HomeiotMusicGnrMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusicgnr~~" 노래 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson44[{homeiottvobject_,homeiottvoption_,homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvoption~~" "~~"변경했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson45[{homeiottvchannel_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = "Null";json["Tts"] = "틀었습니다";json["Pattern"]="Null";json]
SentenceJson46[{homeiotmusicsinger_,homeiotmusicactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Singer"] = homeiotmusicsinger/.HomeiotMusicSingerMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusicsinger~~" 노래 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson47[{homeiottvoption_,homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = HomeiotOption~~" "~~"변경했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson48[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "불 껐습니다";json["Pattern"]="Null";json]
SentenceJson49[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "밝게 켰습니다";json["Pattern"]="Null";json]
SentenceJson50[{homeiottvchannel_,homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson51[{homeiotairconobject_,homeiotaircontemperature_,homeiotairconactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Aircon"]["Object"] = homeiotairconobject/.HomeiotAirconObjectMapping;json["Homeiot"]["Aircon"]["Temperature"] = homeiotaircontemperature/.HomeiotAirconTemperatureMapping;json["Homeiot"]["Aircon"]["Action"] = homeiotairconactiontrue/.HomeiotAirconActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 5;json["Homeiot"]["Aircon"]["Temperature"] = t2;json["Tts"] = homeiotairconobject~~" 온도를 "~~t2~~"도 높였습니다";json["Pattern"]="Null";json]
SentenceJson52[{secretaryfoodobject_,secretaryfoodaction_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Secretary"]["Food"]["Object"] = secretaryfoodobject/.SecretaryFoodObjectMapping;json["Secretary"]["Food"]["Action"] = secretaryfoodaction/.SecretaryFoodActionMapping;json["Tasktype"] = 2;json["Secretary"]["Secretarytype"] = 2;json["Tts"] = secretaryfoodobject~~" 추천은 떡볶이 이면 좋겠어요";json["Pattern"]="Null";json]
SentenceJson53[{homeiotlightobject_,homeiotlightactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 42;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson54[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,homeiotlightlocation_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson55[{homeiotmusicactionfalse_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Action"] = homeiotmusicactionfalse/.HomeiotMusicActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = t1~~" 꺼졌습니다";json["Pattern"]="Null";json]
SentenceJson56[{homeiotlightactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Pattern"] = "Null";json["Tts"] = "불 켰습니다";json["Pattern"]="Null";json]

(* define function template *)
FuncTemplate[SentencePattern4, SentenceParameter4, SentenceJson4]
FuncTemplate[SentencePattern7, SentenceParameter7, SentenceJson7]
FuncTemplate[SentencePattern8, SentenceParameter8, SentenceJson8]
FuncTemplate[SentencePattern27, SentenceParameter27, SentenceJson27]
FuncTemplate[SentencePattern32, SentenceParameter32, SentenceJson32]
FuncTemplate[SentencePattern35, SentenceParameter35, SentenceJson35]
FuncTemplate[SentencePattern41, SentenceParameter41, SentenceJson41]
FuncTemplate[SentencePattern44, SentenceParameter44, SentenceJson44]
FuncTemplate[SentencePattern54, SentenceParameter54, SentenceJson54]
FuncTemplate[SentencePattern1, SentenceParameter1, SentenceJson1]
FuncTemplate[SentencePattern11, SentenceParameter11, SentenceJson11]
FuncTemplate[SentencePattern13, SentenceParameter13, SentenceJson13]
FuncTemplate[SentencePattern14, SentenceParameter14, SentenceJson14]
FuncTemplate[SentencePattern17, SentenceParameter17, SentenceJson17]
FuncTemplate[SentencePattern22, SentenceParameter22, SentenceJson22]
FuncTemplate[SentencePattern31, SentenceParameter31, SentenceJson31]
FuncTemplate[SentencePattern38, SentenceParameter38, SentenceJson38]
FuncTemplate[SentencePattern39, SentenceParameter39, SentenceJson39]
FuncTemplate[SentencePattern47, SentenceParameter47, SentenceJson47]
FuncTemplate[SentencePattern50, SentenceParameter50, SentenceJson50]
FuncTemplate[SentencePattern51, SentenceParameter51, SentenceJson51]
FuncTemplate[SentencePattern6, SentenceParameter6, SentenceJson6]
FuncTemplate[SentencePattern10, SentenceParameter10, SentenceJson10]
FuncTemplate[SentencePattern15, SentenceParameter15, SentenceJson15]
FuncTemplate[SentencePattern16, SentenceParameter16, SentenceJson16]
FuncTemplate[SentencePattern19, SentenceParameter19, SentenceJson19]
FuncTemplate[SentencePattern21, SentenceParameter21, SentenceJson21]
FuncTemplate[SentencePattern23, SentenceParameter23, SentenceJson23]
FuncTemplate[SentencePattern24, SentenceParameter24, SentenceJson24]
FuncTemplate[SentencePattern25, SentenceParameter25, SentenceJson25]
FuncTemplate[SentencePattern33, SentenceParameter33, SentenceJson33]
FuncTemplate[SentencePattern34, SentenceParameter34, SentenceJson34]
FuncTemplate[SentencePattern43, SentenceParameter43, SentenceJson43]
FuncTemplate[SentencePattern46, SentenceParameter46, SentenceJson46]
FuncTemplate[SentencePattern52, SentenceParameter52, SentenceJson52]
FuncTemplate[SentencePattern20, SentenceParameter20, SentenceJson20]
FuncTemplate[SentencePattern29, SentenceParameter29, SentenceJson29]
FuncTemplate[SentencePattern37, SentenceParameter37, SentenceJson37]
FuncTemplate[SentencePattern40, SentenceParameter40, SentenceJson40]
FuncTemplate[SentencePattern42, SentenceParameter42, SentenceJson42]
FuncTemplate[SentencePattern55, SentenceParameter55, SentenceJson55]
FuncTemplate[SentencePattern3, SentenceParameter3, SentenceJson3]
FuncTemplate[SentencePattern18, SentenceParameter18, SentenceJson18]
FuncTemplate[SentencePattern30, SentenceParameter30, SentenceJson30]
FuncTemplate[SentencePattern2, SentenceParameter2, SentenceJson2]
FuncTemplate[SentencePattern5, SentenceParameter5, SentenceJson5]
FuncTemplate[SentencePattern9, SentenceParameter9, SentenceJson9]
FuncTemplate[SentencePattern12, SentenceParameter12, SentenceJson12]
FuncTemplate[SentencePattern26, SentenceParameter26, SentenceJson26]
FuncTemplate[SentencePattern28, SentenceParameter28, SentenceJson28]
FuncTemplate[SentencePattern36, SentenceParameter36, SentenceJson36]
FuncTemplate[SentencePattern45, SentenceParameter45, SentenceJson45]
FuncTemplate[SentencePattern48, SentenceParameter48, SentenceJson48]
FuncTemplate[SentencePattern49, SentenceParameter49, SentenceJson49]
FuncTemplate[SentencePattern53, SentenceParameter53, SentenceJson53]
FuncTemplate[SentencePattern56, SentenceParameter56, SentenceJson56]
