#!/usr/bin/env wolframscript

(* define constant *)
HomeIOTLightLocationLivingroom = "livingroom"
HomeIOTLightLocationRoom = "room"
HomeIOTLightLocationKitchen = "kitchen"
HomeIOTLightLocationBathroom = "bathroom"
HomeIOTLightObjectLight = "light"
HomeIOTLightActionOn = True
HomeIOTLightActionOff = False
HomeIOTLightBrightnessOn = True
HomeIOTLightBrightnessOff = False


(* define morph list *)
HomeIOTLightLocationList = {"거실", "마루", "방", "화장실", "부엌"}
HomeIOTLightObjectList = {"불", "조명"}
HomeIOTLightActionOnList = {"킬", "켜", "켜볼", "켤", "켜기", "켜줘"}
HomeIOTLightActionOffList = {"끄", "꺼", "끌", "꺼볼", "끄기"}
HomeIOTLightBrightnessOnList = {"밝게"}
HomeIOTLightBrightnessOffList = {"어둡게"}


(* define pattern *)
HomeIOTLightLocationPattern = Apply[Alternatives, HomeIOTLightLocationList]
HomeIOTLightObjectPattern = Apply[Alternatives, HomeIOTLightObjectList]
HomeIOTLightActionOnPattern = Apply[Alternatives, HomeIOTLightActionOnList]
HomeIOTLightActionOffPattern = Apply[Alternatives, HomeIOTLightActionOffList]
HomeIOTLightBrightnessOnPattern = Apply[Alternatives, HomeIOTLightBrightnessOnList]
HomeIOTLightBrightnessOffPattern = Apply[Alternatives, HomeIOTLightBrightnessOffList]


(* define mapping *)
HomeIOTLightLocationMapping = { "거실"->HomeIOTLightLocationLivingroom, "마루"->HomeIOTLightLocationLivingroom, "방"->HomeIOTLightLocationRoom, "부엌"->HomeIOTLightLocationKitchen, "화장실"->HomeIOTLightLocationBathroom }
HomeIOTLightObjectMapping = #->HomeIOTLightObjectLight&/@HomeIOTLightObjectList
HomeIOTLightActionOnMapping = #->HomeIOTLightActionOn&/@HomeIOTLightActionOnList
HomeIOTLightActionOffMapping = #->HomeIOTLightActionOff&/@HomeIOTLightActionOffList
HomeIOTLightBrightnessOnMapping = #->HomeIOTLightBrightnessOn&/@HomeIOTLightBrightnessOnList
HomeIOTLightBrightnessOffMapping = #->HomeIOTLightBrightnessOff&/@HomeIOTLightBrightnessOffList


(* define function template parameter *)
HomeIOTLightActionOnPattern1 = ___~~loc:HomeIOTLightLocationPattern~~___~~obj:HomeIOTLightObjectPattern~~___~~act:HomeIOTLightActionOnPattern~~___
HomeIOTLightActionOnPattern2 = ___~~obj:HomeIOTLightObjectPattern~~___~~act:HomeIOTLightActionOnPattern~~___~~loc:HomeIOTLightLocationPattern~~___

HomeIOTLightActionOffPattern1 = ___~~loc:HomeIOTLightLocationPattern~~___~~obj:HomeIOTLightObjectPattern~~___~~act:HomeIOTLightActionOffPattern~~___
HomeIOTLightActionOffPattern2 = ___~~obj:HomeIOTLightObjectPattern~~___~~act:HomeIOTLightActionOffPattern~~___~~loc:HomeIOTLightLocationPattern~~___

HomeIOTLightBrightnessOnPattern1 = ___~~loc:HomeIOTLightLocationPattern~~___~~obj:HomeIOTLightObjectPattern~~___~~bri:HomeIOTLightBrightnessOnPattern~~___

HomeIOTLightBrightnessOffPattern1 = ___~~loc:HomeIOTLightLocationPattern~~___~~obj:HomeIOTLightObjectPattern~~___~~bri:HomeIOTLightBrightnessOffPattern~~___

(*
HomeIOTLightLocationMissingPattern1 = ___~~obj:HomeIOTLightObjectPattern~~___~~act:HomeIOTLightActionOnPattern~~___
HomeIOTLightLocationMissingPattern2 = ___~~obj:HomeIOTLightObjectPattern~~___~~act:HomeIOTLightActionOffPattern~~___
HomeIOTLightLocationMissingPattern3 = ___~~obj:HomeIOTLightObjectPattern~~___~~bri:HomeIOTLightBrightnessOnPattern~~___
HomeIOTLightLocationMissingPattern4 = ___~~obj:HomeIOTLightObjectPattern~~___~~bri:HomeIOTLightBrightnessOffPattern~~___

(* todo *)
HomeIOTLightLocationAnswerPattern1 = ___~~qn:QnumberPattern~~___~~loc:HomeIOTLightLocationPattern~~___
*)

(* define light parameter *)
HomeIOTLightOnParameter = {loc, obj, act}
HomeIOTLightOffParameter = {loc, obj, act}
HomeIOTLightBrightnessOnParameter = {loc, obj, bri}
HomeIOTLightBrightnessOffParameter = {loc, obj, bri}

(*HomeIOTLightLocationMissingParameter = {obj, act}*)


(*  *)
HomeIOTLightOnJson[{loc_, obj_, act_}] := Module[{json = DefaultJson}, 
json["TaskType"] = 1; 
json["TTS"] = loc~~"의 "~~obj~~" 켜졌습니다";
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.HomeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.HomeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = act/.HomeIOTLightActionOnMapping;
json["HomeIOT"]["Light"]["Brightness"] = Null;
json]

HomeIOTLightOffJson[{loc_, obj_, act_}] := Module[{json = DefaultJson}, 
json["TaskType"] = 1; 
json["TTS"] = loc~~"의 "~~obj~~" 꺼졌습니다";
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.HomeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.HomeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = act/.HomeIOTLightActionOffMapping;
json["HomeIOT"]["Light"]["Brightness"] = Null;
json]

HomeIOTLightBrightnessOnJson[{loc_, obj_, bri_}] := Module[{json = DefaultJson}, 
json["TaskType"] = 1; 
json["TTS"] = loc~~"의 "~~obj~~" 밝아졌습니다";
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.HomeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.HomeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = Null;
json["HomeIOT"]["Light"]["Brightness"] = bri/.HomeIOTLightBrightnessOnMapping;
json]

HomeIOTLightBrightnessOffJson[{loc_, obj_, bri_}] := Module[{json = DefaultJson}, 
json["TaskType"] = 1; 
json["TTS"] = loc~~"의 "~~obj~~" 어두워졌습니다";
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.HomeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.HomeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = Null;
json["HomeIOT"]["Light"]["Brightness"] = bri/.HomeIOTLightBrightnessOffMapping;
json]

(*
HomeIOTLightLocationMissingJson[{obj_, act_}] := Module[{json = DefaultJson}, 
json["TaskType"] = 1; 
json["TTS"] = loc~~"의 "~~obj~~" 어두워졌습니다";
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.HomeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.HomeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = act/.HomeIOTLightActionOnMapping
json["HomeIOT"]["Light"]["Brightness"] = bri/.HomeIOTLightBrightnessOffMapping;
json]
*)



(* Creating a function by template *)
FuncTemplate[HomeIOTLightActionOnPattern1, HomeIOTLightOnParameter, HomeIOTLightOnJson]
FuncTemplate[HomeIOTLightActionOnPattern2, HomeIOTLightOnParameter, HomeIOTLightOnJson]
FuncTemplate[HomeIOTLightActionOffPattern1, HomeIOTLightOffParameter, HomeIOTLightOffJson]
FuncTemplate[HomeIOTLightActionOffPattern2, HomeIOTLightOffParameter, HomeIOTLightOffJson]
FuncTemplate[HomeIOTLightBrightnessOnPattern1, HomeIOTLightBrightnessOnParameter, HomeIOTLightBrightnessOnJson]
FuncTemplate[HomeIOTLightBrightnessOffPattern1, HomeIOTLightBrightnessOffParameter, HomeIOTLightBrightnessOffJson]

