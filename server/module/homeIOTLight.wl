
(* define morph pattern *)
HomeiotLightLocation = Apply[Alternatives, {"거실", "마루", "방", "화장실", "부엌", "주방", "전체"}]
HomeiotTvMuteFalse = Apply[Alternatives, {"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "끄기", "꺼봐", "꺼주다", "꺼라", "꺼봐줄래", "꺼볼래", "꺼 줄 수", "끌래"}]
HomeiotLightObject = Apply[Alternatives, {"불", "조명", "등", "형광등", "조명등"}]
HomeiotTvVolumeTrue = Apply[Alternatives, {"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜주다", "켜줄", "높여", "높이다", "높여주다", "높여줄래", "높일래"}]
HomeiotTvPowerTrue = Apply[Alternatives, {"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜라", "켜주다", "켜줄", "바꿔", "바꾸다", "바꿔주다", "바꿔라", "바꿔줄래", "바꿀래", "틀", "틀어", "틀다", "틀기", "틀어주다", "틀을래", "온", "돌려", "돌리다", "돌려", "돌려주다", "보여줘", "봐봐", "보여주다", "알려", "알려줘", "알리다"}]
HomeiotTvChannel = Apply[Alternatives, {"메뉴", "카테고리", "0번", "1번", "2번", "3번", "4번", "5번", "6번", "7번", "8번", "9번", "ytn", "sbs", "cnn", "해외축구", "야구", "해외농구", "음악프로", "애니프로", "게임프로", "교육프로", "YTN", "Ytn", "SBS", "CNN", "Cnn", "축구", "농구", "음악프로그램", "만화", "애니메이션", "애니메이션프로그램", "애니메이션프로", "게임", "게임프로그램", "교육채널", "교육프로그램", "EBS", "ebs"}]
HomeiotLightBrightnessFalse = Apply[Alternatives, {"어둡게", "더 어둡게"}]
HomeiotTvVolumeFalse = Apply[Alternatives, {"줄여", "줄이다", "줄여봐", "줄여주기", "줄여주다", "줄일래", "낮춰", "낮추다", "낮출래"}]
HomeiotTvObject = Apply[Alternatives, {"TV", "Tv", "tv", "티비", "텔레비젼", "테레비", "텔레비전", "리모컨", "리모콘", "소리", "볼륨", "음소거", "채널"}]
HomeiotLightBrightnessTrue = Apply[Alternatives, {"밝게", "더 밝게"}]
HomeiotLightActionFalse = Apply[Alternatives, {"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼봐", "꺼줬", "꺼주세요", "꺼라", "꺼주다", "꺼라", "꺼줄래", "꺼줄", "꺼 줄 수 있", "끌래", "해", "해줘", "줄", "줄여", "해봐", "해봐라", "해라", "해주기", "해줬", "해줄", "해줄래", "해볼래", "해주지", "줄여줄래"}]
HomeiotTvPowerFalse = Apply[Alternatives, {"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼줘라", "끄기", "꺼봐", "꺼봐라", "꺼주다", "꺼줄", "꺼볼래", "끌래", "오프"}]
HomeiotTvMuteTrue = Apply[Alternatives, {"해", "해줘", "하다", "하기", "해봐", "해라", "해주다", "해볼래", "할래", "킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜주세요", "켜라", "켜주다", "켜줄", "켤래", "킬래"}]
HomeiotLightActionTrue = Apply[Alternatives, {"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜봐라", "켜주라", "켜라", "켜줄", "켜 줄", "켜 줄 수"}]
HomeiotTvRemoteLocTrue = Apply[Alternatives, {"알려줘", "알려주다", "알려줄래", "어딨어", "어디에있어", "찾아줘", "찾아줘줄래", "찾아줘볼래"}]

(* define mapping *)
HomeiotLightLocationMapping = {"거실"->"Livingroom", "마루"-> "Livingroom", "방"-> "Room", "화장실"-> "Bathroom", "부엌"-> "Kitchen", "주방"-> "Kitchen", "전체"-> "All"}
HomeiotTvMuteFalseMapping = #->False&/@{"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "끄기", "꺼봐", "꺼주다", "꺼라", "꺼봐줄래", "꺼볼래", "꺼 줄 수", "끌래"}
HomeiotLightObjectMapping = {"불"->"Lamp", "조명"-> "Lamp", "등"-> "Lamp", "형광등"-> "Lamp", "조명등"-> "Lamp"}
HomeiotTvVolumeTrueMapping = #->True&/@{"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜주다", "켜줄", "높여", "높이다", "높여주다", "높여줄래", "높일래"}
HomeiotTvPowerTrueMapping = #->True&/@{"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜라", "켜주다", "켜줄", "바꿔", "바꾸다", "바꿔주다", "바꿔라", "바꿔줄래", "바꿀래", "틀", "틀어", "틀다", "틀기", "틀어주다", "틀을래", "온", "돌려", "돌리다", "돌려", "돌려주다", "보여줘", "봐봐", "보여주다", "알려", "알려줘", "알리다"}
HomeiotTvChannelMapping = {"메뉴"->"10", "카테고리"-> "10", "0번"-> "0", "1번"-> "1", "2번"-> "2", "3번"-> "3", "4번"-> "4", "5번"-> "5", "6번"-> "6", "7번"-> "7", "8번"-> "8", "9번"-> "9", "ytn"-> "0", "sbs"-> "1", "cnn"-> "2", "해외축구"-> "3", "야구"-> "4", "해외농구"-> "5", "음악프로"-> "6", "애니프로"-> "7", "게임프로"-> "8", "교육프로"-> "9", "YTN"-> "0", "Ytn"-> "0", "SBS"-> "1", "CNN"-> "2", "Cnn"-> "2", "축구"-> "3", "농구"-> "5", "음악프로그램"-> "6", "만화"-> "7", "애니메이션"-> "7", "애니메이션프로그램"-> "7", "애니메이션프로"-> "7", "게임"-> "8", "게임프로그램"-> "8", "교육채널"-> "9", "교육프로그램"-> "9", "EBS"-> "9", "ebs"-> "9"}
HomeiotLightBrightnessFalseMapping = #->False&/@{"어둡게", "더 어둡게"}
HomeiotTvVolumeFalseMapping = #->False&/@{"줄여", "줄이다", "줄여봐", "줄여주기", "줄여주다", "줄일래", "낮춰", "낮추다", "낮출래"}
HomeiotTvObjectMapping = {"TV"->"TV", "Tv"-> "TV", "tv"-> "TV", "티비"-> "TV", "텔레비젼"-> "TV", "테레비"-> "TV", "텔레비전"-> "TV", "리모컨"-> "Remotecontrol", "리모콘"-> "Remotecontrol", "소리"-> "Volume", "볼륨"-> "Volume", "음소거"-> "Mute", "채널"-> "Channel"}
HomeiotLightBrightnessTrueMapping = #->True&/@{"밝게", "더 밝게"}
HomeiotLightActionFalseMapping = #->False&/@{"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼봐", "꺼줬", "꺼주세요", "꺼라", "꺼주다", "꺼라", "꺼줄래", "꺼줄", "꺼 줄 수 있", "끌래", "해", "해줘", "줄", "줄여", "해봐", "해봐라", "해라", "해주기", "해줬", "해줄", "해줄래", "해볼래", "해주지", "줄여줄래"}
HomeiotTvPowerFalseMapping = #->False&/@{"끄", "끌", "꺼볼", "꺼", "꺼줘", "끄다", "꺼줘라", "끄기", "꺼봐", "꺼봐라", "꺼주다", "꺼줄", "꺼볼래", "끌래", "오프"}
HomeiotTvMuteTrueMapping = #->True&/@{"해", "해줘", "하다", "하기", "해봐", "해라", "해주다", "해볼래", "할래", "킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜주세요", "켜라", "켜주다", "켜줄", "켤래", "킬래"}
HomeiotLightActionTrueMapping = #->True&/@{"킬", "켜볼", "켤", "켜", "켜줘", "켜다", "켜기", "켜봐", "켜봐라", "켜주라", "켜라", "켜줄", "켜 줄", "켜 줄 수"}
HomeiotTvRemoteLocTrueMapping = #->True&/@{"알려줘", "알려주다", "알려줄래", "어딨어", "어디에있어", "찾아줘", "찾아줘줄래", "찾아줘볼래"}

(* define sentence pattern *)
SentencePattern1 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern2 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvremoteloctrue:HomeiotTvRemoteLocTrue~~___
SentencePattern3 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvvolumefalse:HomeiotTvVolumeFalse~~___
SentencePattern4 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___
SentencePattern5 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvvolumetrue:HomeiotTvVolumeTrue~~___
SentencePattern6 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern7 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern8 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern9 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvmutetrue:HomeiotTvMuteTrue~~___
SentencePattern10 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern11 = ___~~"Q21"~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern12 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvpowerfalse:HomeiotTvPowerFalse~~___
SentencePattern13 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern14 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern15 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern16 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern17 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern18 = ___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvmutefalse:HomeiotTvMuteFalse~~___
SentencePattern19 = ___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern20 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern21 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnessfalse:HomeiotLightBrightnessFalse~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern22 = ___~~"Q30"~~___~~homeiottvchannel:HomeiotTvChannel~~___
SentencePattern23 = ___~~"Q19"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern24 = ___~~"Q24"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern25 = ___~~"Q26"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern26 = ___~~"Q28"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern27 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern28 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightbrightnesstrue:HomeiotLightBrightnessTrue~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern29 = ___~~homeiottvchannel:HomeiotTvChannel~~___~~homeiottvobject:HomeiotTvObject~~___~~homeiottvpowertrue:HomeiotTvPowerTrue~~___
SentencePattern30 = ___~~"Q21"~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___

(* define sentence parameter *)
SentenceParameter1 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue}
SentenceParameter2 = {homeiottvobject,homeiottvremoteloctrue}
SentenceParameter3 = {homeiottvobject,homeiottvvolumefalse}
SentenceParameter4 = {homeiotlightlocation,homeiotlightobject}
SentenceParameter5 = {homeiottvobject,homeiottvvolumetrue}
SentenceParameter6 = {homeiottvobject,homeiottvchannel,homeiottvpowertrue}
SentenceParameter7 = {homeiotlightobject,homeiotlightactionfalse,homeiotlightlocation}
SentenceParameter8 = {homeiottvobject,homeiottvpowertrue}
SentenceParameter9 = {homeiottvobject,homeiottvmutetrue}
SentenceParameter10 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse}
SentenceParameter11 = {homeiotlightactionfalse}
SentenceParameter12 = {homeiottvobject,homeiottvpowerfalse}
SentenceParameter13 = {homeiotlightlocation,homeiotlightobject,homeiotlightactionfalse}
SentenceParameter14 = {homeiotlightobject,homeiotlightactionfalse}
SentenceParameter15 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue}
SentenceParameter16 = {homeiotlightlocation,homeiotlightobject,homeiotlightactiontrue}
SentenceParameter17 = {homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse,homeiotlightlocation}
SentenceParameter18 = {homeiottvobject,homeiottvmutefalse}
SentenceParameter19 = {homeiottvchannel,homeiottvpowertrue}
SentenceParameter20 = {homeiotlightobject,homeiotlightactiontrue,homeiotlightlocation}
SentenceParameter21 = {homeiotlightlocation,homeiotlightobject,homeiotlightbrightnessfalse,homeiotlightactionfalse}
SentenceParameter22 = {homeiottvchannel}
SentenceParameter23 = {homeiotlightlocation}
SentenceParameter24 = {homeiotlightlocation}
SentenceParameter25 = {homeiotlightlocation}
SentenceParameter26 = {homeiotlightlocation}
SentenceParameter27 = {homeiotlightobject,homeiotlightactiontrue}
SentenceParameter28 = {homeiotlightobject,homeiotlightbrightnesstrue,homeiotlightactiontrue,homeiotlightlocation}
SentenceParameter29 = {homeiottvchannel,homeiottvobject,homeiottvpowertrue}
SentenceParameter30 = {homeiotlightactiontrue}

(* define sentence json *)
SentenceJson1[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson2[{homeiottvobject_,homeiottvremoteloctrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Remote"]["Loc"] = homeiottvremoteloctrue/.HomeiotTvRemoteLocTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"찾았습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson3[{homeiottvobject_,homeiottvvolumefalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumefalse/.HomeiotTvVolumeFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"줄였습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson4[{homeiotlightlocation_,homeiotlightobject_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 21;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~" 어떻게 할까요?";json]
SentenceJson5[{homeiottvobject_,homeiottvvolumetrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Volume"] = homeiottvvolumetrue/.HomeiotTvVolumeTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"높였습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson6[{homeiottvobject_,homeiottvchannel_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson7[{homeiotlightobject_,homeiotlightactionfalse_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson8[{homeiottvobject_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 2;json["Pattern"] = 30;json["Tts"] = "어떤 채널을 원하시나요?";json]
SentenceJson9[{homeiottvobject_,homeiottvmutetrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutetrue/.HomeiotTvMuteTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"했습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson10[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 28;json["Tts"] = "어디를 어둡게 해 드릴까요?";json]
SentenceJson11[{homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Pattern"] = Null;json["Tts"] = "불 껐습니다";json]
SentenceJson12[{homeiottvobject_,homeiottvpowerfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowerfalse/.HomeiotTvPowerFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson13[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson14[{homeiotlightobject_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 24;json["Tts"] = "어디를 꺼 드릴까요?";json]
SentenceJson15[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 26;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson16[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson17[{homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson18[{homeiottvobject_,homeiottvmutefalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Mute"] = homeiottvmutefalse/.HomeiotTvMuteFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvobject~~" "~~"껐습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson19[{homeiottvchannel_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson20[{homeiotlightobject_,homeiotlightactiontrue_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson21[{homeiotlightlocation_,homeiotlightobject_,homeiotlightbrightnessfalse_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnessfalse/.HomeiotLightBrightnessFalseMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"어둡게 했습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson22[{homeiottvchannel_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Pattern"] = Null;json["Tts"] = homeiottvchannel~~" "~~"틀었습니다";json]
SentenceJson23[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = Null;json["Tts"] = "불 켰습니다";json]
SentenceJson24[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = Null;json["Tts"] = "불 껐습니다";json]
SentenceJson25[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = Null;json["Tts"] = "밝게 켰습니다";json]
SentenceJson26[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = Null;json["Tts"] = "어둡게 했습니다";json]
SentenceJson27[{homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 19;json["Tts"] = "어디를 켜 드릴까요?";json]
SentenceJson28[{homeiotlightobject_,homeiotlightbrightnesstrue_,homeiotlightactiontrue_,homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Brightness"] = homeiotlightbrightnesstrue/.HomeiotLightBrightnessTrueMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~" "~~homeiotlightobject~~"을 "~~"밝게 켰습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson29[{homeiottvchannel_,homeiottvobject_,homeiottvpowertrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Tv"]["Channel"] = homeiottvchannel/.HomeiotTvChannelMapping;json["Homeiot"]["Tv"]["Object"] = homeiottvobject/.HomeiotTvObjectMapping;json["Homeiot"]["Tv"]["Power"] = homeiottvpowertrue/.HomeiotTvPowerTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiottvchannel~~" "~~"켰습니다";json["Homeiot"]["Homeiottype"] = 2;json]
SentenceJson30[{homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Pattern"] = Null;json["Tts"] = "불 켰습니다";json]

(* define function template *)
FuncTemplate[SentencePattern1, SentenceParameter1, SentenceJson1]
FuncTemplate[SentencePattern17, SentenceParameter17, SentenceJson17]
FuncTemplate[SentencePattern21, SentenceParameter21, SentenceJson21]
FuncTemplate[SentencePattern28, SentenceParameter28, SentenceJson28]
FuncTemplate[SentencePattern6, SentenceParameter6, SentenceJson6]
FuncTemplate[SentencePattern7, SentenceParameter7, SentenceJson7]
FuncTemplate[SentencePattern13, SentenceParameter13, SentenceJson13]
FuncTemplate[SentencePattern16, SentenceParameter16, SentenceJson16]
FuncTemplate[SentencePattern20, SentenceParameter20, SentenceJson20]
FuncTemplate[SentencePattern29, SentenceParameter29, SentenceJson29]
FuncTemplate[SentencePattern2, SentenceParameter2, SentenceJson2]
FuncTemplate[SentencePattern3, SentenceParameter3, SentenceJson3]
FuncTemplate[SentencePattern5, SentenceParameter5, SentenceJson5]
FuncTemplate[SentencePattern9, SentenceParameter9, SentenceJson9]
FuncTemplate[SentencePattern12, SentenceParameter12, SentenceJson12]
FuncTemplate[SentencePattern18, SentenceParameter18, SentenceJson18]
FuncTemplate[SentencePattern19, SentenceParameter19, SentenceJson19]
FuncTemplate[SentencePattern10, SentenceParameter10, SentenceJson10]
FuncTemplate[SentencePattern15, SentenceParameter15, SentenceJson15]
FuncTemplate[SentencePattern4, SentenceParameter4, SentenceJson4]
FuncTemplate[SentencePattern8, SentenceParameter8, SentenceJson8]
FuncTemplate[SentencePattern11, SentenceParameter11, SentenceJson11]
FuncTemplate[SentencePattern14, SentenceParameter14, SentenceJson14]
FuncTemplate[SentencePattern22, SentenceParameter22, SentenceJson22]
FuncTemplate[SentencePattern23, SentenceParameter23, SentenceJson23]
FuncTemplate[SentencePattern24, SentenceParameter24, SentenceJson24]
FuncTemplate[SentencePattern25, SentenceParameter25, SentenceJson25]
FuncTemplate[SentencePattern26, SentenceParameter26, SentenceJson26]
FuncTemplate[SentencePattern27, SentenceParameter27, SentenceJson27]
FuncTemplate[SentencePattern30, SentenceParameter30, SentenceJson30]
