
(* define morph pattern *)
HomeiotLightLocation = Apply[Alternatives, {"거실", "마루", "방", "화장실", "욕실", "부엌", "주방", "전체"}]
HomeiotTvMuteFalse = Apply[Alternatives, {"음소거 끄", "음소거 끌", "음소거 꺼볼", "음소거 꺼", "음소거 꺼줘", "음소거 끄다", "음소거 끄기", "음소거 꺼봐", "음소거 꺼주다", "음소거 꺼라", "음소거 꺼봐줄래", "음소거 꺼볼래", "음소거 꺼 줄 수", "음소거 끌래"}]
HomeiotLightObject = Apply[Alternatives, {"불", "조명", "등", "형광등", "조명등"}]
HomeiotTvVolumeTrue = Apply[Alternatives, {"소리 킬", "소리 켜볼", "소리 켤", "소리 켜", "소리 켜줘", "소리 켜다", "소리 켜기", "소리 켜봐", "소리 켜주다", "소리 켜줄", "소리 높여", "소리 높이다", "소리 높여주다", "소리 높여줄래", "소리 높일래", "볼륨 킬", "볼륨 켜볼", "볼륨 켤", "볼륨 켜", "볼륨 켜줘", "볼륨 켜다", "볼륨 켜기", "볼륨 켜봐", "볼륨 켜주다", "볼륨 켜줄", "볼륨 높여", "볼륨 높이다", "볼륨 높여주다", "볼륨 높여줄래", "볼륨 높일래"}]
HomeiotTvPowerTrue = Apply[Alternatives, {"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜라", "켜주다", "켜줄", "바꿔", "바꾸다", "바꿔주다", "바꿔라", "바꿔줄래", "바꿀래", "틀", "틀어", "틀다", "틀기", "틀어주다", "틀을래", "온", "돌려", "돌리다", "돌려", "돌려주다", "보여줘", "봐봐", "보여주다", "알려", "알려줘", "알리다", "변경", "변경해", "변경하다"}]
HomeiotTvChannel = Apply[Alternatives, {"메뉴", "카테고리", "0번", "1번", "2번", "3번", "4번", "5번", "6번", "7번", "8번", "9번", "ytn", "sbs", "cnn", "해외축구", "야구", "해외농구", "음악프로", "애니프로", "게임프로", "교육프로", "YTN", "Ytn", "SBS", "CNN", "Cnn", "축구", "농구", "음악프로그램", "만화", "애니메이션", "애니메이션프로그램", "애니메이션프로", "게임", "게임프로그램", "교육채널", "교육프로그램", "EBS", "ebs"}]
HomeiotLightBrightnessFalse = Apply[Alternatives, {"어둡게", "더 어둡게"}]
HomeiotTvVolumeFalse = Apply[Alternatives, {"소리 줄여", "소리 줄이다", "소리 줄여봐", "소리 줄여주기", "소리 줄여주다", "소리 줄일래", "소리 낮춰", "소리 낮추다", "소리 낮출래", "볼륨 줄여", "볼륨 줄이다", "볼륨 줄여봐", "볼륨 줄여주기", "볼륨 줄여주다", "볼륨 줄일래", "볼륨 낮춰", "볼륨 낮추다", "볼륨 낮출래"}]
HomeiotTvOption = Apply[Alternatives, {"채널", "번호"}]
HomeiotTvObject = Apply[Alternatives, {"TV", "Tv", "tv", "티비", "텔레비젼", "테레비", "텔레비전", "리모컨", "리모콘"}]
HomeiotLightBrightnessTrue = Apply[Alternatives, {"밝게", "더 밝게"}]
HomeiotLightActionFalse = Apply[Alternatives, {"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼봐", "꺼줬", "꺼주세요", "꺼라", "꺼주다", "꺼라", "꺼줄래", "꺼줄", "꺼 줄 수 있", "끌래", "해", "해줘", "줄", "줄여", "해봐", "해봐라", "해라", "해주기", "해줬", "해줄", "해줄래", "해볼래", "해주지", "줄여줄래"}]
HomeiotTvPowerFalse = Apply[Alternatives, {"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼줘라", "끄기", "꺼봐", "꺼봐라", "꺼주다", "꺼줄", "꺼볼래", "끌래", "오프"}]
HomeiotTvMuteTrue = Apply[Alternatives, {"음소거 해", "음소거 해줘", "음소거 하다", "음소거 하기", "음소거 해봐", "음소거 해라", "음소거 해주다", "음소거 해볼래", "음소거 할래", "음소거 킬", "음소거 켜볼", "음소거 켤", "음소거 켜", "음소거 켜줘", "음소거 켜다", "음소거 켜기", "음소거 켜봐", "음소거 켜주세요", "음소거 켜라", "음소거 켜주다", "음소거 켜줄", "음소거 켤래", "음소거 킬래"}]
HomeiotLightActionTrue = Apply[Alternatives, {"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜봐라", "켜주라", "켜라", "켜줄", "켜 줄", "켜 줄 수"}]
HomeiotTvRemotelocTrue = Apply[Alternatives, {"알려줘", "알려주다", "알려줄래", "어딨어", "어디에있어", "찾아줘", "찾아줘줄래", "찾아줘볼래"}]

(* define mapping *)
HomeiotLightLocationMapping = {"거실"->"Livingroom", "마루"-> "Livingroom", "방"-> "Room", "화장실"-> "Bathroom", "욕실"-> "Bathroom", "부엌"-> "Kitchen", "주방"-> "Kitchen", "전체"-> "All"}
HomeiotTvMuteFalseMapping = #->False&/@{"음소거 끄", "음소거 끌", "음소거 꺼볼", "음소거 꺼", "음소거 꺼줘", "음소거 끄다", "음소거 끄기", "음소거 꺼봐", "음소거 꺼주다", "음소거 꺼라", "음소거 꺼봐줄래", "음소거 꺼볼래", "음소거 꺼 줄 수", "음소거 끌래"}
HomeiotLightObjectMapping = {"불"->"Lamp", "조명"-> "Lamp", "등"-> "Lamp", "형광등"-> "Lamp", "조명등"-> "Lamp"}
HomeiotTvVolumeTrueMapping = #->True&/@{"소리 킬", "소리 켜볼", "소리 켤", "소리 켜", "소리 켜줘", "소리 켜다", "소리 켜기", "소리 켜봐", "소리 켜주다", "소리 켜줄", "소리 높여", "소리 높이다", "소리 높여주다", "소리 높여줄래", "소리 높일래", "볼륨 킬", "볼륨 켜볼", "볼륨 켤", "볼륨 켜", "볼륨 켜줘", "볼륨 켜다", "볼륨 켜기", "볼륨 켜봐", "볼륨 켜주다", "볼륨 켜줄", "볼륨 높여", "볼륨 높이다", "볼륨 높여주다", "볼륨 높여줄래", "볼륨 높일래"}
HomeiotTvPowerTrueMapping = #->True&/@{"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜라", "켜주다", "켜줄", "바꿔", "바꾸다", "바꿔주다", "바꿔라", "바꿔줄래", "바꿀래", "틀", "틀어", "틀다", "틀기", "틀어주다", "틀을래", "온", "돌려", "돌리다", "돌려", "돌려주다", "보여줘", "봐봐", "보여주다", "알려", "알려줘", "알리다", "변경", "변경해", "변경하다"}
HomeiotTvChannelMapping = {"메뉴"->"10", "카테고리"-> "10", "0번"-> "0", "1번"-> "1", "2번"-> "2", "3번"-> "3", "4번"-> "4", "5번"-> "5", "6번"-> "6", "7번"-> "7", "8번"-> "8", "9번"-> "9", "ytn"-> "0", "sbs"-> "1", "cnn"-> "2", "해외축구"-> "3", "야구"-> "4", "해외농구"-> "5", "음악프로"-> "6", "애니프로"-> "7", "게임프로"-> "8", "교육프로"-> "9", "YTN"-> "0", "Ytn"-> "0", "SBS"-> "1", "CNN"-> "2", "Cnn"-> "2", "축구"-> "3", "농구"-> "5", "음악프로그램"-> "6", "만화"-> "7", "애니메이션"-> "7", "애니메이션프로그램"-> "7", "애니메이션프로"-> "7", "게임"-> "8", "게임프로그램"-> "8", "교육채널"-> "9", "교육프로그램"-> "9", "EBS"-> "9", "ebs"-> "9"}
HomeiotLightBrightnessFalseMapping = #->False&/@{"어둡게", "더 어둡게"}
HomeiotTvVolumeFalseMapping = #->False&/@{"소리 줄여", "소리 줄이다", "소리 줄여봐", "소리 줄여주기", "소리 줄여주다", "소리 줄일래", "소리 낮춰", "소리 낮추다", "소리 낮출래", "볼륨 줄여", "볼륨 줄이다", "볼륨 줄여봐", "볼륨 줄여주기", "볼륨 줄여주다", "볼륨 줄일래", "볼륨 낮춰", "볼륨 낮추다", "볼륨 낮출래"}
HomeiotTvOptionMapping = {"채널"->"Channel", "번호"-> "Channel"}
HomeiotTvObjectMapping = {"TV"->"TV", "Tv"-> "TV", "tv"-> "TV", "티비"-> "TV", "텔레비젼"-> "TV", "테레비"-> "TV", "텔레비전"-> "TV", "리모컨"-> "Remotecontrol", "리모콘"-> "Remotecontrol"}
HomeiotLightBrightnessTrueMapping = #->True&/@{"밝게", "더 밝게"}
HomeiotLightActionFalseMapping = #->False&/@{"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼봐", "꺼줬", "꺼주세요", "꺼라", "꺼주다", "꺼라", "꺼줄래", "꺼줄", "꺼 줄 수 있", "끌래", "해", "해줘", "줄", "줄여", "해봐", "해봐라", "해라", "해주기", "해줬", "해줄", "해줄래", "해볼래", "해주지", "줄여줄래"}
HomeiotTvPowerFalseMapping = #->False&/@{"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼줘라", "끄기", "꺼봐", "꺼봐라", "꺼주다", "꺼줄", "꺼볼래", "끌래", "오프"}
HomeiotTvMuteTrueMapping = #->True&/@{"음소거 해", "음소거 해줘", "음소거 하다", "음소거 하기", "음소거 해봐", "음소거 해라", "음소거 해주다", "음소거 해볼래", "음소거 할래", "음소거 킬", "음소거 켜볼", "음소거 켤", "음소거 켜", "음소거 켜줘", "음소거 켜다", "음소거 켜기", "음소거 켜봐", "음소거 켜주세요", "음소거 켜라", "음소거 켜주다", "음소거 켜줄", "음소거 켤래", "음소거 킬래"}
HomeiotLightActionTrueMapping = #->True&/@{"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜봐라", "켜주라", "켜라", "켜줄", "켜 줄", "켜 줄 수"}
HomeiotTvRemotelocTrueMapping = #->True&/@{"알려줘", "알려주다", "알려줄래", "어딨어", "어디에있어", "찾아줘", "찾아줘줄래", "찾아줘볼래"}

(* define sentence pattern *)
SentencePattern1 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvoption:HomeiotTvOption~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern2 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern3 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___
SentencePattern4 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~___
SentencePattern5 = ___~~homeiottvoption:HomeiotTvOption~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern6 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~___
SentencePattern7 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern8 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern9 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern10 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvmutetrue:HomeiotTvMuteTrue~~___
SentencePattern11 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern12 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvremoteloctrue:HomeiotTvRemotelocTrue~~___
SentencePattern13 = ___~~"Q28"~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern14 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvpowerfalse:HomeiotTvPowerFalse~~___
SentencePattern15 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern16 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern17 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern18 = ___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~___
SentencePattern19 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern20 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern21 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern22 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvmutefalse:HomeiotTvMuteFalse~~___
SentencePattern23 = ___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern24 = ___~~"Q37"~~___~~homeiottvchannel:HomeiotTvChannel~~___
SentencePattern25 = ___~~homeiottvmutetrue:HomeiotTvMuteTrue~~___
SentencePattern26 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern27 = ___~~homeiottvmutefalse:HomeiotTvMuteFalse~~___
SentencePattern28 = ___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~___
SentencePattern29 = ___~~"Q26"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern30 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvoption:HomeiotTvOption~~___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern31 = ___~~"Q39"~~___~~homeiottvchannel:HomeiotTvChannel~~___
SentencePattern32 = ___~~homeiottvoption:HomeiotTvOption~~___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern33 = ___~~"Q31"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern34 = ___~~"Q33"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern35 = ___~~"Q35"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern36 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern37 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern38 = ___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern39 = ___~~"Q28"~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___

(* define sentence parameter *)
SentenceParameter1 = {homeiottvobject,homeiottvoption,homeiottvpowertrue}
SentenceParameter2 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue}
SentenceParameter3 = {homeiotlightlocation,homeiotlightobject}
SentenceParameter4 = {homeiottvobject,homeiottvvolumefalse}
SentenceParameter5 = {homeiottvoption,homeiottvpowertrue}
SentenceParameter6 = {homeiottvobject,homeiottvvolumetrue}
SentenceParameter7 = {homeiottvobject,homeiottvchannel,homeiottvpowertrue}
SentenceParameter8 = {homeiotlightobject,homeiotlightactionfalse,homeiotlightlocation}
SentenceParameter9 = {homeiottvobject,homeiottvpowertrue}
SentenceParameter10 = {homeiottvobject,homeiottvmutetrue}
SentenceParameter11 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse}
SentenceParameter12 = {homeiottvobject,homeiottvremoteloctrue}
SentenceParameter13 = {homeiotlightactionfalse}
SentenceParameter14 = {homeiottvobject,homeiottvpowerfalse}
SentenceParameter15 = {homeiotlightlocation,homeiotlightobject,homeiotlightactionfalse}
SentenceParameter16 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse}
SentenceParameter17 = {homeiotlightobject,homeiotlightactionfalse}
SentenceParameter18 = {homeiottvvolumefalse}
SentenceParameter19 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue}
SentenceParameter20 = {homeiotlightlocation,homeiotlightobject,homeiotlightactiontrue}
SentenceParameter21 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,homeiotlightlocation}
SentenceParameter22 = {homeiottvobject,homeiottvmutefalse}
SentenceParameter23 = {homeiottvchannel,homeiottvpowertrue}
SentenceParameter24 = {homeiottvchannel}
SentenceParameter25 = {homeiottvmutetrue}
SentenceParameter26 = {homeiotlightobject,homeiotlightactiontrue,homeiotlightlocation}
SentenceParameter27 = {homeiottvmutefalse}
SentenceParameter28 = {homeiottvvolumetrue}
SentenceParameter29 = {homeiotlightlocation}
SentenceParameter30 = {homeiottvobject,homeiottvoption,homeiottvchannel,homeiottvpowertrue}
SentenceParameter31 = {homeiottvchannel}
SentenceParameter32 = {homeiottvoption,homeiottvchannel,homeiottvpowertrue}
SentenceParameter33 = {homeiotlightlocation}
SentenceParameter34 = {homeiotlightlocation}
SentenceParameter35 = {homeiotlightlocation}
SentenceParameter36 = {homeiotlightobject,homeiotlightactiontrue}
SentenceParameter37 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,homeiotlightlocation}
SentenceParameter38 = {homeiottvchannel,homeiottvobject,homeiottvpowertrue}
SentenceParameter39 = {homeiotlightactiontrue}

(* define sentence json *)
SentenceJson1[{homeiottvobject_,homeiottvoption_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 39;json["Tts"] = "어떤 채널로 틀어드릴까요?";json]
SentenceJson2[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson3[{homeiotlightlocation_,homeiotlightobject_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 28;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~" 어떻게 할까요?";json]
SentenceJson4[{homeiottvobject_,homeiottvvolumefalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"볼륨 줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson5[{homeiottvoption_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 37;json["Tts"] = "어떤 채널로 틀어드릴까요?";json]
SentenceJson6[{homeiottvobject_,homeiottvvolumetrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"볼륨 높였습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson7[{homeiottvobject_,homeiottvchannel_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson8[{homeiotlightobject_,homeiotlightactionfalse_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson9[{homeiottvobject_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson10[{homeiottvobject_,homeiottvmutetrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"음소거 했습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson11[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 35;json["Tts"] = "어디를 어둡게 해 드릴까요?";json]
SentenceJson12[{homeiottvobject_,homeiottvremoteloctrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Remoteloc"] = homeiottvremoteloctrue/.HomeiotTvRemotelocTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"찾았습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson13[{homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Pattern"] = "Null";json["Tts"] = "불 껐습니다";json]
SentenceJson14[{homeiottvobject_,homeiottvpowerfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowerfalse/.HomeiotTvPowerFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson15[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson16[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson17[{homeiotlightobject_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 31;json["Tts"] = "어디를 꺼 드릴까요?";json]
SentenceJson18[{homeiottvvolumefalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = "볼륨 줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson19[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 33;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson20[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson21[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson22[{homeiottvobject_,homeiottvmutefalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"음소거 껐습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson23[{homeiottvchannel_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = "틀었습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson24[{homeiottvchannel_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = "Null";json["Tts"] = "틀었습니다";json]
SentenceJson25[{homeiottvmutetrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = "음소거 했습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson26[{homeiotlightobject_,homeiotlightactiontrue_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson27[{homeiottvmutefalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = "음소거 껐습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson28[{homeiottvvolumetrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = "볼륨 높였습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson29[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "불 켰습니다";json]
SentenceJson30[{homeiottvobject_,homeiottvoption_,homeiottvchannel_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvoption~~" "~~"변경했습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson31[{homeiottvchannel_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = "Null";json["Tts"] = "틀었습니다";json]
SentenceJson32[{homeiottvoption_,homeiottvchannel_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Option"] = homeiottvoption/.HomeiotTvOptionMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = HomeiotOption~~" "~~"변경했습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson33[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "불 껐습니다";json]
SentenceJson34[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "밝게 켰습니다";json]
SentenceJson35[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = "Null";json["Tts"] = "어둡게 했습니다";json]
SentenceJson36[{homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 26;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson37[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson38[{homeiottvchannel_,homeiottvobject_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson39[{homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Pattern"] = "Null";json["Tts"] = "불 켰습니다";json]

(* define function template *)
FuncTemplate[SentencePattern2, SentenceParameter2, SentenceJson2]
FuncTemplate[SentencePattern16, SentenceParameter16, SentenceJson16]
FuncTemplate[SentencePattern21, SentenceParameter21, SentenceJson21]
FuncTemplate[SentencePattern30, SentenceParameter30, SentenceJson30]
FuncTemplate[SentencePattern37, SentenceParameter37, SentenceJson37]
FuncTemplate[SentencePattern7, SentenceParameter7, SentenceJson7]
FuncTemplate[SentencePattern8, SentenceParameter8, SentenceJson8]
FuncTemplate[SentencePattern15, SentenceParameter15, SentenceJson15]
FuncTemplate[SentencePattern20, SentenceParameter20, SentenceJson20]
FuncTemplate[SentencePattern26, SentenceParameter26, SentenceJson26]
FuncTemplate[SentencePattern32, SentenceParameter32, SentenceJson32]
FuncTemplate[SentencePattern38, SentenceParameter38, SentenceJson38]
FuncTemplate[SentencePattern4, SentenceParameter4, SentenceJson4]
FuncTemplate[SentencePattern6, SentenceParameter6, SentenceJson6]
FuncTemplate[SentencePattern9, SentenceParameter9, SentenceJson9]
FuncTemplate[SentencePattern10, SentenceParameter10, SentenceJson10]
FuncTemplate[SentencePattern12, SentenceParameter12, SentenceJson12]
FuncTemplate[SentencePattern14, SentenceParameter14, SentenceJson14]
FuncTemplate[SentencePattern22, SentenceParameter22, SentenceJson22]
FuncTemplate[SentencePattern23, SentenceParameter23, SentenceJson23]
FuncTemplate[SentencePattern18, SentenceParameter18, SentenceJson18]
FuncTemplate[SentencePattern25, SentenceParameter25, SentenceJson25]
FuncTemplate[SentencePattern27, SentenceParameter27, SentenceJson27]
FuncTemplate[SentencePattern28, SentenceParameter28, SentenceJson28]
FuncTemplate[SentencePattern1, SentenceParameter1, SentenceJson1]
FuncTemplate[SentencePattern11, SentenceParameter11, SentenceJson11]
FuncTemplate[SentencePattern19, SentenceParameter19, SentenceJson19]
FuncTemplate[SentencePattern3, SentenceParameter3, SentenceJson3]
FuncTemplate[SentencePattern5, SentenceParameter5, SentenceJson5]
FuncTemplate[SentencePattern13, SentenceParameter13, SentenceJson13]
FuncTemplate[SentencePattern17, SentenceParameter17, SentenceJson17]
FuncTemplate[SentencePattern24, SentenceParameter24, SentenceJson24]
FuncTemplate[SentencePattern29, SentenceParameter29, SentenceJson29]
FuncTemplate[SentencePattern31, SentenceParameter31, SentenceJson31]
FuncTemplate[SentencePattern33, SentenceParameter33, SentenceJson33]
FuncTemplate[SentencePattern34, SentenceParameter34, SentenceJson34]
FuncTemplate[SentencePattern35, SentenceParameter35, SentenceJson35]
FuncTemplate[SentencePattern36, SentenceParameter36, SentenceJson36]
FuncTemplate[SentencePattern39, SentenceParameter39, SentenceJson39]
