#!/usr/bin/env wolframscript

(* for korean string *)
kstr[str:_] := FromCharacterCode[ImportString[str,"Byte"],"UTF-8"]
kstr[a:_->b:_] := kstr[a]->kstr[b]
kstr[list:_List] := kstr/@list
kstr[num:_Number] := num


(* define constant *)
homeIOTLightLocationLivingroom = "livingroom"
homeIOTLightLocationRoom = "room"
homeIOTLightLocationKitchen = "kitchen"
homeIOTLightLocationBathroom = "bathroom"
homeIOTLightObjectLight = "light"
homeIOTLightActionOn = True
homeIOTLightActionOff = False
homeIOTLightBrightnessOn = True
homeIOTLightBrightnessOff = False


(* define morph list *)
homeIOTLightLocationList = kstr[{"거실", "마루", "방", "화장실", "부엌"}]
homeIOTLightObjectList = kstr[{"불", "조명"}]
homeIOTLightActionOnList = kstr[{"킬", "켜", "켜볼", "켤", "켜기", "켜줘"}]
homeIOTLightActionOffList = kstr[{"끄", "꺼", "끌", "꺼볼", "끄기"}]
homeIOTLightBrightnessOnList = kstr[{"밝게"}]
homeIOTLightBrightnessOffList = kstr[{"어둡게"}]


(* define pattern *)
homeIOTLightLocationPattern = Apply[Alternatives, homeIOTLightLocationList]
homeIOTLightObjectPattern = Apply[Alternatives, homeIOTLightObjectList]
homeIOTLightActionOnPattern = Apply[Alternatives, homeIOTLightActionOnList]
homeIOTLightActionOffPattern = Apply[Alternatives, homeIOTLightActionOffList]
homeIOTLightBrightnessOnPattern = Apply[Alternatives, homeIOTLightBrightnessOnList]
homeIOTLightBrightnessOffPattern = Apply[Alternatives, homeIOTLightBrightnessOffList]


(* define mapping *)
homeIOTLightLocationMapping = kstr[{ "거실"->homeIOTLightLocationLivingroom, "마루"->homeIOTLightLocationLivingroom, "방"->homeIOTLightLocationRoom, "부엌"->homeIOTLightLocationKitchen, "화장실"->homeIOTLightLocationBathroom }]
homeIOTLightObjectMapping = #->homeIOTLightObjectLight&/@homeIOTLightObjectList
homeIOTLightActionOnMapping = #->homeIOTLightActionOn&/@homeIOTLightActionOnList
homeIOTLightActionOffMapping = #->homeIOTLightActionOff&/@homeIOTLightActionOffList
homeIOTLightBrightnessOnMapping = #->homeIOTLightBrightnessOn&/@homeIOTLightBrightnessOnList
homeIOTLightBrightnessOffMapping = #->homeIOTLightBrightnessOff&/@homeIOTLightBrightnessOffList


(* define function template parameter *)
homeIOTLightActionOnPattern1 = ___~~loc:homeIOTLightLocationPattern~~___~~obj:homeIOTLightObjectPattern~~___~~act:homeIOTLightActionOnPattern~~___
homeIOTLightActionOnPattern2 = ___~~obj:homeIOTLightObjectPattern~~___~~act:homeIOTLightActionOnPattern~~___~~loc:homeIOTLightLocationPattern~~___
homeIOTLightOnParameter = {loc, obj, act}
homeIOTLightOnJson[{loc_, obj_, act_}] := Module[{json = defaultJson}, 
json["TaskType"] = 1; 
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.homeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.homeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = act/.homeIOTLightActionOnMapping;
json["HomeIOT"]["Light"]["Brightness"] = Null;
json]

homeIOTLightActionOffPattern1 = ___~~loc:homeIOTLightLocationPattern~~___~~obj:homeIOTLightObjectPattern~~___~~act:homeIOTLightActionOffPattern~~___
homeIOTLightActionOffPattern2 = ___~~obj:homeIOTLightObjectPattern~~___~~act:homeIOTLightActionOffPattern~~___~~loc:homeIOTLightLocationPattern~~___
homeIOTLightOffParameter = {loc, obj, act}
homeIOTLightOffJson[{loc_, obj_, act_}] := Module[{json = defaultJson}, 
json["TaskType"] = 1; 
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.homeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.homeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = act/.homeIOTLightActionOffMapping;
json["HomeIOT"]["Light"]["Brightness"] = Null;
json]

(* Todo : brightness function template parameter *)
homeIOTLightBrightnessOnPattern1 = ___~~loc:homeIOTLightLocationPattern~~___~~obj:homeIOTLightObjectPattern~~___~~bri:homeIOTLightBrightnessOnPattern~~___
homeIOTLightBrightnessOnParameter = {loc, obj, bri}
homeIOTLightBrightnessOnJson[{loc_, obj_, bri_}] := Module[{json = defaultJson}, 
json["TaskType"] = 1; 
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.homeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.homeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = Null;
json["HomeIOT"]["Light"]["Brightness"] = bri/.homeIOTLightBrightnessOnMapping;
json]

homeIOTLightBrightnessOffPattern1 = ___~~loc:homeIOTLightLocationPattern~~___~~obj:homeIOTLightObjectPattern~~___~~bri:homeIOTLightBrightnessOffPattern~~___
homeIOTLightBrightnessOffParameter = {loc, obj, bri}
homeIOTLightBrightnessOffJson[{loc_, obj_, bri_}] := Module[{json = defaultJson}, 
json["TaskType"] = 1; 
json["HomeIOT"]["HomeIOTType"] = 1;
json["HomeIOT"]["Light"]["Location"] = loc/.homeIOTLightLocationMapping;
json["HomeIOT"]["Light"]["Object"] = obj/.homeIOTLightObjectMapping;
json["HomeIOT"]["Light"]["Action"] = Null;
json["HomeIOT"]["Light"]["Brightness"] = bri/.homeIOTLightBrightnessOffMapping;
json]

(* define funciton template *)
funcTemplate := (runCommand[s_String /; StringMatchQ[s, #1]] := Module[{param = Flatten[StringCases[s, #1->#2]]}, #3[param]])&


(* read protocol json file *)
defaultJson = Import["protocol.json", "RawJSON"]


(* read user input *)
(* sentence = kstr[$ScriptCommandLine[[2]]] *)
sentence = kstr["거실 불 밝게 해줘"]
Print["sentence : ", sentence]


(* Creating a function by template *)
funcTemplate[homeIOTLightActionOnPattern1, homeIOTLightOnParameter, homeIOTLightOnJson]
funcTemplate[homeIOTLightActionOnPattern2, homeIOTLightOnParameter, homeIOTLightOnJson]
funcTemplate[homeIOTLightActionOffPattern1, homeIOTLightOffParameter, homeIOTLightOffJson]
funcTemplate[homeIOTLightActionOffPattern2, homeIOTLightOffParameter, homeIOTLightOffJson]
funcTemplate[homeIOTLightBrightnessOnPattern1, homeIOTLightBrightnessOnParameter, homeIOTLightBrightnessOnJson]
funcTemplate[homeIOTLightBrightnessOffPattern1, homeIOTLightBrightnessOffParameter, homeIOTLightBrightnessOffJson]


(* run function *)
runCommand[unknown:_] := "unknown pattern catched..."


(* json result *)
json = runCommand[sentence]
Print[json]
Print[ExportString[json,"RawJSON"]]

