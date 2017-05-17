
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
HomeiotLightBrightnessFalseMapping = #->False&/@HomeiotLightBrightnessFalse
HomeiotLightBrightnessTrueMapping = #->True&/@HomeiotLightBrightnessTrue
HomeiotLightActionFalseMapping = #->False&/@HomeiotLightActionFalse
HomeiotLightActionTrueMapping = #->True&/@HomeiotLightActionTrue

(* define sentence pattern *)
SentencePattern1 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactionfalse:HomeiotLightActionFalse~~___
SentencePattern2 = ___~~homeiotlightlocation:HomeiotLightLocation~~___~~homeiotlightobject:HomeiotLightObject~~___~~homeiotlightactiontrue:HomeiotLightActionTrue~~___

(* define sentence parameter *)
SentenceParameter1 = {homeiotlightlocation,homeiotlightobject,homeiotlightactionfalse}
SentenceParameter2 = {homeiotlightlocation,homeiotlightobject,homeiotlightactiontrue}

(* define sentence json *)
SentenceJson1[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactionfalse_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactionfalse/.HomeiotLightActionFalseMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~"의 "~~homeiotlightobject~~" "~~"꺼졌습니다";json["Homeiot"]["Homeiottype"] = 1;json]
SentenceJson2[{homeiotlightlocation_,homeiotlightobject_,homeiotlightactiontrue_}] := Module[{json = DefaultJson},json["Homeiot"]["Light"]["Location"] = homeiotlightlocation/.HomeiotLightLocationMapping;json["Homeiot"]["Light"]["Object"] = homeiotlightobject/.HomeiotLightObjectMapping;json["Homeiot"]["Light"]["Action"] = homeiotlightactiontrue/.HomeiotLightActionTrueMapping;json["Tasktype"] = 1;json["Tts"] = homeiotlightlocation~~"의 "~~homeiotlightobject~~" "~~"켜졌습니다";json["Homeiot"]["Homeiottype"] = 1;json]

(* define function template *)
FuncTemplate[SentencePattern1, SentenceParameter1, SentenceJson1]
FuncTemplate[SentencePattern2, SentenceParameter2, SentenceJson2]
