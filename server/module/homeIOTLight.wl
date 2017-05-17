
(* define morph pattern *)
HomeiotLightLocation = Apply[Alternatives, {"거실", "마루", "방", "화장실", "부엌"}]
HomeiotLightObject = Apply[Alternatives, {"불", "조명"}]
HomeiotLightBrightnessFalse = Apply[Alternatives, {"어둡게"}]
HomeiotLightBrightnessTrue = Apply[Alternatives, {"밝게"}]
HomeiotLightActionFalse = Apply[Alternatives, {"끄", "꺼", "끌", "꺼볼", "끄기"}]
HomeiotLightActionTrue = Apply[Alternatives, {"킬", "켜", "켜볼", "켤", "켜기", "켜줘"}]

(* define mapping *)
HomeiotLightLocationMapping = {"거실"->"livingroom", "마루"-> "livingroom", "방"-> "room", "화장실"-> "bathroom", "부엌"-> "kitchen"}
HomeiotLightObjectMapping = {"불"->"light", "조명"-> "light"}
HomeiotLightBrightnessFalseMapping = #->False&/@{"어둡게"}
HomeiotLightBrightnessTrueMapping = #->True&/@{"밝게"}
HomeiotLightActionFalseMapping = #->False&/@{"끄", "꺼", "끌", "꺼볼", "끄기"}
HomeiotLightActionTrueMapping = #->True&/@{"킬", "켜", "켜볼", "켤", "켜기", "켜줘"}

(* define sentence pattern *)
SentencePattern1 = ___~~"Q3"~~___~~homeiotlightlocation:HomeiotLightLocation~~___
SentencePattern2 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___
SentencePattern3 = ___~~"Q5"~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern4 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern5 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern6 = ___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___
SentencePattern7 = ___~~"Q5"~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___

(* define sentence parameter *)
SentenceParameter1 = {homeiotlightlocation}
SentenceParameter2 = {homeiotlightlocation,homeiotlightobject}
SentenceParameter3 = {homeiotlightactionfalse}
SentenceParameter4 = {homeiotlightlocation,homeiotlightobject,homeiotlightactiontrue}
SentenceParameter5 = {homeiotlightlocation,homeiotlightobject,homeiotlightactionfalse}
SentenceParameter6 = {homeiotlightobject,homeiotlightactiontrue}
SentenceParameter7 = {homeiotlightactiontrue}

(* define sentence json *)
SentenceJson1[{homeiotlightlocation_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Pattern"] = Null;json["Tts"] = homeiotlightlocation;json]
SentenceJson2[{homeiotlightlocation_,homeiotlightobject_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 5;json["Tts"] = homeiotlightlocation~~"의 "~~homeiotlightobject~~" 어떻게 할까요?";json]
SentenceJson3[{homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Pattern"] = Null;json["Tts"] = "꺼졌습니다";json]
SentenceJson4[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~"의 "~~homeiotlightobject~~" "~~"켜졌습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson5[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~"의 "~~homeiotlightobject~~" "~~"꺼졌습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson6[{homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Homeiot"]["Homeiottype"] = 1;json["Pattern"] = 3;json["Tts"] = "어디를 켜야 할까요?";json]
SentenceJson7[{homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Pattern"] = Null;json["Tts"] = "켜졌습니다";json]

(* define function template *)
FuncTemplate[SentencePattern4, SentenceParameter4, SentenceJson4]
FuncTemplate[SentencePattern5, SentenceParameter5, SentenceJson5]

FuncTemplate[SentencePattern2, SentenceParameter2, SentenceJson2]
FuncTemplate[SentencePattern6, SentenceParameter6, SentenceJson6]
FuncTemplate[SentencePattern7, SentenceParameter7, SentenceJson7]

FuncTemplate[SentencePattern3, SentenceParameter3, SentenceJson3]
FuncTemplate[SentencePattern1, SentenceParameter1, SentenceJson1]
