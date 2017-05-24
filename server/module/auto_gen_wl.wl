
(* define morph pattern *)
SecretaryFoodAction = Apply[Alternatives, {"뭐먹을", "추천"}]
HomeiotLightBrightnessFalse = Apply[Alternatives, {"어둡게"}]
HomeiotMusicSinger = Apply[Alternatives, {"아이유", "이적"}]
HomeiotTvObject = Apply[Alternatives, {"TV", "Tv", "tv", "티비", "텔레비", "테레비"}]
HomeiotLightBrightnessTrue = Apply[Alternatives, {"밝게"}]
HomeiotLightObject = Apply[Alternatives, {"불", "조명", "등", "형광등", "조명등"}]
HomeiotTvMuteTrue = Apply[Alternatives, {"음소거해", "음소거하", "음소거할", "음소거킬", "음소거켜", "음소거켤"}]
HomeiotTvChannel = Apply[Alternatives, {"메뉴", "카테고리", "0번", "1번", "2번", "3번", "4번", "5번", "6번", "7번", "8번", "9번", "ytn", "sbs", "cnn", "해외축구", "야구", "해외농구", "음악프로", "애니프로", "게임프로", "교육프로", "YTN", "Ytn", "SBS", "CNN", "Cnn", "축구", "농구", "음악프로그램", "만화", "애니메이션", "애니메이션프로그램", "애니메이션프로", "게임", "게임프로그램", "교육채널", "교육프로그램", "EBS", "ebs"}]
HomeiotMusicActionTrue = Apply[Alternatives, {"음악 틀어", "노래 틀어", "곡 틀어", "틀어"}]
HomeiotLightActionFalse = Apply[Alternatives, {"끄", "끌", "꺼"}]
HomeiotMusicGnr = Apply[Alternatives, {"가요", "OST"}]
HomeiotLightActionTrue = Apply[Alternatives, {"킬", "켤", "켜"}]
HomeiotLightLocation = Apply[Alternatives, {"거실", "마루", "방", "화장실", "욕실", "부엌", "주방", "전체"}]
HomeiotTvPowerTrue = Apply[Alternatives, {"킬", "켤", "켜", "바꿔", "바꾸", "바꿀", "틀", "온", "돌려", "돌리", "보여", "봐봐", "알려", "알리", "변경"}]
HomeiotTvVolumeFalse = Apply[Alternatives, {"소리줄", "소리낮", "볼륨줄", "볼륨낮", "음량낮", "음량줄"}]
HomeiotTvOption = Apply[Alternatives, {"채널", "번호"}]
HomeiotTvComponent = Apply[Alternatives, {"리모컨", "리모콘"}]
HomeiotMusicActionFalse = Apply[Alternatives, {"음악 꺼줘", "노래 꺼줘", "곡 꺼줘"}]
HomeiotTvPowerFalse = Apply[Alternatives, {"끄", "끌", "꺼", "오프"}]
HomeiotMusicTitle = Apply[Alternatives, {"밤편지", "걱정말아요그대"}]
HomeiotTvMuteFalse = Apply[Alternatives, {"음소거끄", "음소거끌", "음소거꺼"}]
HomeiotTvVolumeTrue = Apply[Alternatives, {"소리킬", "소리켜", "소리켤", "소리높", "볼륨킬", "볼륨켜", "볼륨켤", "볼륨높", "음량높", "음량올"}]
HomeiotTvRemotelocTrue = Apply[Alternatives, {"알려", "어딨", "어디", "찾아"}]
SecretaryFoodObject = Apply[Alternatives, {"아침", "점심", "저녁", "음식"}]

(* define mapping *)
SecretaryFoodActionMapping = {"뭐먹을"->"act", "추천"-> "act"}
HomeiotLightBrightnessFalseMapping = #->False&/@{"어둡게"}
HomeiotMusicSingerMapping = {"아이유"->"IU", "이적"-> "LEE_JUK"}
HomeiotTvObjectMapping = {"TV"->"TV", "Tv"-> "TV", "tv"-> "TV", "티비"-> "TV", "텔레비"-> "TV", "테레비"-> "TV"}
HomeiotLightBrightnessTrueMapping = #->True&/@{"밝게"}
HomeiotLightObjectMapping = {"불"->"Lamp", "조명"-> "Lamp", "등"-> "Lamp", "형광등"-> "Lamp", "조명등"-> "Lamp"}
HomeiotTvMuteTrueMapping = #->True&/@{"음소거해", "음소거하", "음소거할", "음소거킬", "음소거켜", "음소거켤"}
HomeiotTvChannelMapping = {"메뉴"->"10", "카테고리"-> "10", "0번"-> "0", "1번"-> "1", "2번"-> "2", "3번"-> "3", "4번"-> "4", "5번"-> "5", "6번"-> "6", "7번"-> "7", "8번"-> "8", "9번"-> "9", "ytn"-> "0", "sbs"-> "1", "cnn"-> "2", "해외축구"-> "3", "야구"-> "4", "해외농구"-> "5", "음악프로"-> "6", "애니프로"-> "7", "게임프로"-> "8", "교육프로"-> "9", "YTN"-> "0", "Ytn"-> "0", "SBS"-> "1", "CNN"-> "2", "Cnn"-> "2", "축구"-> "3", "농구"-> "5", "음악프로그램"-> "6", "만화"-> "7", "애니메이션"-> "7", "애니메이션프로그램"-> "7", "애니메이션프로"-> "7", "게임"-> "8", "게임프로그램"-> "8", "교육채널"-> "9", "교육프로그램"-> "9", "EBS"-> "9", "ebs"-> "9"}
HomeiotMusicActionTrueMapping = #->True&/@{"음악 틀어", "노래 틀어", "곡 틀어", "틀어"}
HomeiotLightActionFalseMapping = #->False&/@{"끄", "끌", "꺼"}
HomeiotMusicGnrMapping = {"가요"->"Song", "OST"-> "OST"}
HomeiotLightActionTrueMapping = #->True&/@{"킬", "켤", "켜"}
HomeiotLightLocationMapping = {"거실"->"Livingroom", "마루"-> "Livingroom", "방"-> "Room", "화장실"-> "Bathroom", "욕실"-> "Bathroom", "부엌"-> "Kitchen", "주방"-> "Kitchen", "전체"-> "All"}
HomeiotTvPowerTrueMapping = #->True&/@{"킬", "켤", "켜", "바꿔", "바꾸", "바꿀", "틀", "온", "돌려", "돌리", "보여", "봐봐", "알려", "알리", "변경"}
HomeiotTvVolumeFalseMapping = #->False&/@{"소리줄", "소리낮", "볼륨줄", "볼륨낮", "음량낮", "음량줄"}
HomeiotTvOptionMapping = {"채널"->"Channel", "번호"-> "Channel"}
HomeiotTvComponentMapping = {"리모컨"->"Remotecontrol", "리모콘"-> "Remotecontrol"}
HomeiotMusicActionFalseMapping = #->False&/@{"음악 꺼줘", "노래 꺼줘", "곡 꺼줘"}
HomeiotTvPowerFalseMapping = #->False&/@{"끄", "끌", "꺼", "오프"}
HomeiotMusicTitleMapping = {"밤편지"->"Through_The_Night", "걱정말아요그대"-> "Don't_worry_dear"}
HomeiotTvMuteFalseMapping = #->False&/@{"음소거끄", "음소거끌", "음소거꺼"}
HomeiotTvVolumeTrueMapping = #->True&/@{"소리킬", "소리켜", "소리켤", "소리높", "볼륨킬", "볼륨켜", "볼륨켤", "볼륨높", "음량높", "음량올"}
HomeiotTvRemotelocTrueMapping = #->True&/@{"알려", "어딨", "어디", "찾아"}
SecretaryFoodObjectMapping = {"아침"->"food", "점심"-> "food", "저녁"->"food", "음식"->"food"}

(* define sentence pattern *)
SentencePattern1 = t1:___~~"Q36"~~t2:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t3:___
SentencePattern2 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvoption:HomeiotTvOption~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern3 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~t4:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t5:___
SentencePattern4 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___
SentencePattern5 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~t3:___
SentencePattern6 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___~~homeiottvoption:HomeiotTvOption~~t4:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t5:___
SentencePattern7 = t1:___~~homeiottvoption:HomeiotTvOption~~t2:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t3:___
SentencePattern8 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~t3:___
SentencePattern9 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern10 = t1:___~~"Q43"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern11 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t3:___~~homeiotlightlocation:HomeiotLightLocation~~t4:___
SentencePattern12 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t3:___
SentencePattern13 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvmutetrue:HomeiotTvMuteTrue~~t3:___
SentencePattern14 = t1:___~~homeiotmusicsinger:HomeiotMusicSinger~~t2:___~~homeiotmusictitle:HomeiotMusicTitle~~t3:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t4:___
SentencePattern15 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~t3:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t4:___
SentencePattern16 = t1:___~~homeiotmusictitle:HomeiotMusicTitle~~t2:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t3:___
SentencePattern17 = t1:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t2:___
SentencePattern18 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvpowerfalse:HomeiotTvPowerFalse~~t3:___
SentencePattern19 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t4:___
SentencePattern20 = t1:___~~homeiottvcomponent:HomeiotTvComponent~~t2:___~~homeiottvremoteloctrue:HomeiotTvRemotelocTrue~~t3:___
SentencePattern21 = t1:___~~"Q34"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern22 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~t4:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t5:___
SentencePattern23 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t3:___
SentencePattern24 = t1:___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~t2:___
SentencePattern25 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~t3:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t4:___
SentencePattern26 = t1:___~~homeiotlightlocation:HomeiotLightLocation~~t2:___~~homeiotlightobject:HomeiotLightObject~~t3:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t4:___
SentencePattern27 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~t3:___~~homeiotlightactionfalse:HomeiotLightActionFalse~~t4:___~~homeiotlightlocation:HomeiotLightLocation~~t5:___
SentencePattern28 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvmutefalse:HomeiotTvMuteFalse~~t3:___
SentencePattern29 = t1:___~~homeiottvchannel:HomeiotTvChannel~~t2:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t3:___
SentencePattern30 = t1:___~~"Q45"~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___
SentencePattern31 = t1:___~~homeiottvmutetrue:HomeiotTvMuteTrue~~t2:___
SentencePattern32 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvcomponent:HomeiotTvComponent~~t3:___~~homeiottvremoteloctrue:HomeiotTvRemotelocTrue~~t4:___
SentencePattern33 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t3:___~~homeiotlightlocation:HomeiotLightLocation~~t4:___
SentencePattern34 = t1:___~~homeiottvmutefalse:HomeiotTvMuteFalse~~t2:___
SentencePattern35 = t1:___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~t2:___
SentencePattern36 = t1:___~~homeiotmusicgnr:HomeiotMusicGnr~~t2:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t3:___
SentencePattern37 = t1:___~~homeiottvobject:HomeiotTvObject~~t2:___~~homeiottvoption:HomeiotTvOption~~t3:___~~homeiottvchannel:HomeiotTvChannel~~t4:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t5:___
SentencePattern38 = t1:___~~"Q47"~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___
SentencePattern39 = t1:___~~homeiotmusicsinger:HomeiotMusicSinger~~t2:___~~homeiotmusicactiontrue:HomeiotMusicActionTrue~~t3:___
SentencePattern40 = t1:___~~homeiottvoption:HomeiotTvOption~~t2:___~~homeiottvchannel:HomeiotTvChannel~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern41 = t1:___~~"Q39"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern42 = t1:___~~"Q41"~~t2:___~~homeiotlightlocation:HomeiotLightLocation~~t3:___
SentencePattern43 = t1:___~~homeiottvchannel:HomeiotTvChannel~~t2:___~~homeiottvoption:HomeiotTvOption~~t3:___~~homeiottvpowertrue:HomeiotTvPowerTrue~~t4:___
SentencePattern44 = t1:___~~secretaryfoodobject:SecretaryFoodObject~~t2:___~~secretaryfoodaction:SecretaryFoodAction~~t3:___
SentencePattern45 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t3:___
SentencePattern46 = t1:___~~homeiotlightobject:HomeiotLightObject~~t2:___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~t3:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t4:___~~homeiotlightlocation:HomeiotLightLocation~~t5:___
SentencePattern47 = t1:___~~homeiotmusicactionfalse:HomeiotMusicActionFalse~~t2:___
SentencePattern48 = t1:___~~"Q36"~~t2:___~~homeiotlightactiontrue:HomeiotLightActionTrue~~t3:___

(* define sentence parameter *)
SentenceParameter1 = {homeiotlightactionfalse,t1,t2,t3}
SentenceParameter2 = {homeiottvobject,homeiottvoption,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter3 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,t1,t2,t3,t4,t5}
SentenceParameter4 = {homeiotlightlocation,homeiotlightobject,t1,t2,t3}
SentenceParameter5 = {homeiottvobject,homeiottvvolumefalse,t1,t2,t3}
SentenceParameter6 = {homeiottvobject,homeiottvchannel,homeiottvoption,homeiottvpowertrue,t1,t2,t3,t4,t5}
SentenceParameter7 = {homeiottvoption,homeiottvpowertrue,t1,t2,t3}
SentenceParameter8 = {homeiottvobject,homeiottvvolumetrue,t1,t2,t3}
SentenceParameter9 = {homeiottvobject,homeiottvchannel,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter10 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter11 = {homeiotlightobject,homeiotlightactionfalse,homeiotlightlocation,t1,t2,t3,t4}
SentenceParameter12 = {homeiottvobject,homeiottvpowertrue,t1,t2,t3}
SentenceParameter13 = {homeiottvobject,homeiottvmutetrue,t1,t2,t3}
SentenceParameter14 = {homeiotmusicsinger,homeiotmusictitle,homeiotmusicactiontrue,t1,t2,t3,t4}
SentenceParameter15 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,t1,t2,t3,t4}
SentenceParameter16 = {homeiotmusictitle,homeiotmusicactiontrue,t1,t2,t3}
SentenceParameter17 = {homeiotmusicactiontrue,t1,t2}
SentenceParameter18 = {homeiottvobject,homeiottvpowerfalse,t1,t2,t3}
SentenceParameter19 = {homeiotlightlocation,homeiotlightobject,homeiotlightactionfalse,t1,t2,t3,t4}
SentenceParameter20 = {homeiottvcomponent,homeiottvremoteloctrue,t1,t2,t3}
SentenceParameter21 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter22 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,t1,t2,t3,t4,t5}
SentenceParameter23 = {homeiotlightobject,homeiotlightactionfalse,t1,t2,t3}
SentenceParameter24 = {homeiottvvolumefalse,t1,t2}
SentenceParameter25 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,t1,t2,t3,t4}
SentenceParameter26 = {homeiotlightlocation,homeiotlightobject,homeiotlightactiontrue,t1,t2,t3,t4}
SentenceParameter27 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,homeiotlightlocation,t1,t2,t3,t4,t5}
SentenceParameter28 = {homeiottvobject,homeiottvmutefalse,t1,t2,t3}
SentenceParameter29 = {homeiottvchannel,homeiottvpowertrue,t1,t2,t3}
SentenceParameter30 = {homeiottvchannel,t1,t2,t3}
SentenceParameter31 = {homeiottvmutetrue,t1,t2}
SentenceParameter32 = {homeiottvobject,homeiottvcomponent,homeiottvremoteloctrue,t1,t2,t3,t4}
SentenceParameter33 = {homeiotlightobject,homeiotlightactiontrue,homeiotlightlocation,t1,t2,t3,t4}
SentenceParameter34 = {homeiottvmutefalse,t1,t2}
SentenceParameter35 = {homeiottvvolumetrue,t1,t2}
SentenceParameter36 = {homeiotmusicgnr,homeiotmusicactiontrue,t1,t2,t3}
SentenceParameter37 = {homeiottvobject,homeiottvoption,homeiottvchannel,homeiottvpowertrue,t1,t2,t3,t4,t5}
SentenceParameter38 = {homeiottvchannel,t1,t2,t3}
SentenceParameter39 = {homeiotmusicsinger,homeiotmusicactiontrue,t1,t2,t3}
SentenceParameter40 = {homeiottvoption,homeiottvchannel,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter41 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter42 = {homeiotlightlocation,t1,t2,t3}
SentenceParameter43 = {homeiottvchannel,homeiottvoption,homeiottvpowertrue,t1,t2,t3,t4}
SentenceParameter44 = {secretaryfoodobject,secretaryfoodaction,t1,t2,t3}
SentenceParameter45 = {homeiotlightobject,homeiotlightactiontrue,t1,t2,t3}
SentenceParameter46 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,homeiotlightlocation,t1,t2,t3,t4,t5}
SentenceParameter47 = {homeiotmusicactionfalse,t1,t2}
SentenceParameter48 = {homeiotlightactiontrue,t1,t2,t3}

(* define sentence json *)
SentenceJson1[{homeiotlightactionfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Pattern"] = "Null";json["Tts"] = "불 껐습니다";json["Pattern"]="Null";json]
SentenceJson2[{homeiottvobject_,homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 47;json["Tts"] = "어떤 채널로 틀어드릴까요?";json]
SentenceJson3[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson4[{homeiotlightlocation_,homeiotlightobject_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 36;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~" 어떻게 할까요?";json]
SentenceJson5[{homeiottvobject_,homeiottvvolumefalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"볼륨 줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson6[{homeiottvobject_,homeiottvchannel_,homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson7[{homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 45;json["Tts"] = "어떤 채널로 틀어드릴까요?";json]
SentenceJson8[{homeiottvobject_,homeiottvvolumetrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"볼륨 높였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson9[{homeiottvobject_,homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson10[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "어둡게 했습니다";json["Pattern"]="Null";json]
SentenceJson11[{homeiotlightobject_,homeiotlightactionfalse_,homeiotlightlocation_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson12[{homeiottvobject_,homeiottvpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson13[{homeiottvobject_,homeiottvmutetrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"음소거 했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson14[{homeiotmusicsinger_,homeiotmusictitle_,homeiotmusicactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Singer"] = homeiotmusicsinger/.HomeiotMusicSingerMapping;json["Homeiot"]["Music"]["Title"] = homeiotmusictitle/.HomeiotMusicTitleMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusicsinger~~"의"~~homeiotmusictitle~~" 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson15[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 43;json["Tts"] = "어디를 어둡게 해 드릴까요?";json]
SentenceJson16[{homeiotmusictitle_,homeiotmusicactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Title"] = homeiotmusictitle/.HomeiotMusicTitleMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusictitle~~" 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson17[{homeiotmusicactiontrue_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = t1~~" 켜졌습니다";json["Pattern"]="Null";json]
SentenceJson18[{homeiottvobject_,homeiottvpowerfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowerfalse/.HomeiotTvPowerFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson19[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactionfalse_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson20[{homeiottvcomponent_,homeiottvremoteloctrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Component"] = homeiottvcomponent/.HomeiotTvComponentMapping;json["Homeiot"]["Tv"]["Remoteloc"] = homeiottvremoteloctrue/.HomeiotTvRemotelocTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvcomponent~~" "~~"찾았습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson21[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "불 켰습니다";json["Pattern"]="Null";json]
SentenceJson22[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson23[{homeiotlightobject_,homeiotlightactionfalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 39;json["Tts"] = "어디를 꺼 드릴까요?";json]
SentenceJson24[{homeiottvvolumefalse_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = "볼륨 줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson25[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 41;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson26[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactiontrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson27[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,homeiotlightlocation_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson28[{homeiottvobject_,homeiottvmutefalse_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"음소거 껐습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson29[{homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson30[{homeiottvchannel_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = "Null";json["Tts"] = "틀었습니다";json["Pattern"]="Null";json]
SentenceJson31[{homeiottvmutetrue_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = "음소거 했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson32[{homeiottvobject_,homeiottvcomponent_,homeiottvremoteloctrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Component"] = homeiottvcomponent/.HomeiotTvComponentMapping;json["Homeiot"]["Tv"]["Remoteloc"] = homeiottvremoteloctrue/.HomeiotTvRemotelocTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvcomponent~~" "~~"찾았습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson33[{homeiotlightobject_,homeiotlightactiontrue_,homeiotlightlocation_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson34[{homeiottvmutefalse_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = "음소거 껐습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson35[{homeiottvvolumetrue_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = "볼륨 높였습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson36[{homeiotmusicgnr_,homeiotmusicactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Gnr"] = homeiotmusicgnr/.HomeiotMusicGnrMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusicgnr~~" 노래 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson37[{homeiottvobject_,homeiottvoption_,homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvoption~~" "~~"변경했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson38[{homeiottvchannel_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = "Null";json["Tts"] = "틀었습니다";json["Pattern"]="Null";json]
SentenceJson39[{homeiotmusicsinger_,homeiotmusicactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Singer"] = homeiotmusicsinger/.HomeiotMusicSingerMapping;json["Homeiot"]["Music"]["Action"] = homeiotmusicactiontrue/.HomeiotMusicActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = homeiotmusicsinger~~" 노래 켜졌습니다!";json["Pattern"]="Null";json]
SentenceJson40[{homeiottvoption_,homeiottvchannel_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = HomeiotOption~~" "~~"변경했습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson41[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "불 껐습니다";json["Pattern"]="Null";json]
SentenceJson42[{homeiotlightlocation_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "밝게 켰습니다";json["Pattern"]="Null";json]
SentenceJson43[{homeiottvchannel_,homeiottvoption_,homeiottvpowertrue_,t1_,t2_,t3_,t4_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json["Pattern"]="Null";json]
SentenceJson44[{secretaryfoodobject_,secretaryfoodaction_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Secretary"]["Food"]["Object"] = secretaryfoodobject/.SecretaryFoodObjectMapping;json["Secretary"]["Food"]["Action"] = secretaryfoodaction/.SecretaryFoodActionMapping;json["Tasktype"] = 2;json["Secretary"]["Secretarytype"] = 2;json["Tts"] = secretaryfoodobject~~" 추천은 떡볶이가 좋겠어요";json["Pattern"]="Null";json]
SentenceJson45[{homeiotlightobject_,homeiotlightactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 34;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson46[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,homeiotlightlocation_,t1_,t2_,t3_,t4_,t5_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json["Pattern"]="Null";json]
SentenceJson47[{homeiotmusicactionfalse_,t1_,t2_}] := Module[{json = DefaultJson},json["Homeiot"]["Music"]["Action"] = homeiotmusicactionfalse/.HomeiotMusicActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 4;json["Tts"] = t1~~" 꺼졌습니다";json["Pattern"]="Null";json]
SentenceJson48[{homeiotlightactiontrue_,t1_,t2_,t3_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Pattern"] = "Null";json["Tts"] = "불 켰습니다";json["Pattern"]="Null";json]

(* define function template *)
FuncTemplate[SentencePattern3, SentenceParameter3, SentenceJson3]
FuncTemplate[SentencePattern6, SentenceParameter6, SentenceJson6]
FuncTemplate[SentencePattern22, SentenceParameter22, SentenceJson22]
FuncTemplate[SentencePattern27, SentenceParameter27, SentenceJson27]
FuncTemplate[SentencePattern37, SentenceParameter37, SentenceJson37]
FuncTemplate[SentencePattern46, SentenceParameter46, SentenceJson46]
FuncTemplate[SentencePattern9, SentenceParameter9, SentenceJson9]
FuncTemplate[SentencePattern11, SentenceParameter11, SentenceJson11]
FuncTemplate[SentencePattern14, SentenceParameter14, SentenceJson14]
FuncTemplate[SentencePattern19, SentenceParameter19, SentenceJson19]
FuncTemplate[SentencePattern26, SentenceParameter26, SentenceJson26]
FuncTemplate[SentencePattern32, SentenceParameter32, SentenceJson32]
FuncTemplate[SentencePattern33, SentenceParameter33, SentenceJson33]
FuncTemplate[SentencePattern40, SentenceParameter40, SentenceJson40]
FuncTemplate[SentencePattern43, SentenceParameter43, SentenceJson43]
FuncTemplate[SentencePattern5, SentenceParameter5, SentenceJson5]
FuncTemplate[SentencePattern8, SentenceParameter8, SentenceJson8]
FuncTemplate[SentencePattern12, SentenceParameter12, SentenceJson12]
FuncTemplate[SentencePattern13, SentenceParameter13, SentenceJson13]
FuncTemplate[SentencePattern16, SentenceParameter16, SentenceJson16]
FuncTemplate[SentencePattern18, SentenceParameter18, SentenceJson18]
FuncTemplate[SentencePattern20, SentenceParameter20, SentenceJson20]
FuncTemplate[SentencePattern28, SentenceParameter28, SentenceJson28]
FuncTemplate[SentencePattern29, SentenceParameter29, SentenceJson29]
FuncTemplate[SentencePattern36, SentenceParameter36, SentenceJson36]
FuncTemplate[SentencePattern39, SentenceParameter39, SentenceJson39]
FuncTemplate[SentencePattern44, SentenceParameter44, SentenceJson44]
FuncTemplate[SentencePattern17, SentenceParameter17, SentenceJson17]
FuncTemplate[SentencePattern24, SentenceParameter24, SentenceJson24]
FuncTemplate[SentencePattern31, SentenceParameter31, SentenceJson31]
FuncTemplate[SentencePattern34, SentenceParameter34, SentenceJson34]
FuncTemplate[SentencePattern35, SentenceParameter35, SentenceJson35]
FuncTemplate[SentencePattern47, SentenceParameter47, SentenceJson47]
FuncTemplate[SentencePattern2, SentenceParameter2, SentenceJson2]
FuncTemplate[SentencePattern15, SentenceParameter15, SentenceJson15]
FuncTemplate[SentencePattern25, SentenceParameter25, SentenceJson25]
FuncTemplate[SentencePattern1, SentenceParameter1, SentenceJson1]
FuncTemplate[SentencePattern4, SentenceParameter4, SentenceJson4]
FuncTemplate[SentencePattern7, SentenceParameter7, SentenceJson7]
FuncTemplate[SentencePattern10, SentenceParameter10, SentenceJson10]
FuncTemplate[SentencePattern21, SentenceParameter21, SentenceJson21]
FuncTemplate[SentencePattern23, SentenceParameter23, SentenceJson23]
FuncTemplate[SentencePattern30, SentenceParameter30, SentenceJson30]
FuncTemplate[SentencePattern38, SentenceParameter38, SentenceJson38]
FuncTemplate[SentencePattern41, SentenceParameter41, SentenceJson41]
FuncTemplate[SentencePattern42, SentenceParameter42, SentenceJson42]
FuncTemplate[SentencePattern45, SentenceParameter45, SentenceJson45]
FuncTemplate[SentencePattern48, SentenceParameter48, SentenceJson48]
