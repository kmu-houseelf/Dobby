#!/usr/bin/env wolframscript

(* read korean string *)
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


(* define morph list *)
homeIOTLightLocationList = kstr[{"거실", "마루", "방", "화장실", "부엌"}]
homeIOTLightObjectList = kstr[{"불", "조명"}]
homeIOTLightActionOnList = kstr[{"킬", "켜", "켜볼", "켤", "켜기"}]
homeIOTLightActionOffList = kstr[{"끄", "꺼", "끌", "꺼볼", "끄기"}]


(* define pattern *)
homeIOTLightLocationPattern = Apply[Alternatives, homeIOTLightLocationList]
homeIOTLightObjectPattern = Apply[Alternatives, homeIOTLightObjectList]
homeIOTLightActionOnPattern = Apply[Alternatives, homeIOTLightActionOnList]
homeIOTLightActionOffPattern = Apply[Alternatives, homeIOTLightActionOffList]

(* define mapping *)
homeIOTLightLocationMapping = kstr[{ "거실"->homeIOTLightLocationLivingroom, "마루"->homeIOTLightLocationLivingroom, "방"->homeIOTLightLocationRoom, "부엌"->homeIOTLightLocationKitchen, "화장실"->homeIOTLightLocationBathroom }]
homeIOTLightObjectMapping = #->homeIOTLightObjectLight&/@homeIOTLightObjectList
homeIOTLightActionOnMapping = #->homeIOTLightActionOn&/@homeIOTLightActionOnList
homeIOTLightActionOffMapping = #->homeIOTLightActionOff&/@homeIOTLightActionOffList


(* read user input *)
sentence = FromCharacterCode[ImportString[$ScriptCommandLine[[2]], "Byte"],"UTF-8"]
Print["----- Sentence : "~~sentence]


(* run morph analysis *)
template = StringTemplate["`python` morph.py \"`sentence`\""]
commandString := TemplateApply[template, <|"python"->"python", "sentence"->sentence |>]
commandString//Print
Run[commandString]


(* read morph sentence *)
result = kstr[ReadString["temp.txt"]]
Print["----- morph sentence"]
result//Print


(* generate morph list *)
morphList = StringSplit[result,","]
Print["----- morph list"]
morphList//Print


(* read protocol json file *)
defaultJson = Import["protocol.json", "RawJSON"]
userJson = defaultJson


(* pattern matching function *)
commandRun[{t1:___, loc:homeIOTLightLocationPattern, t2:___, obj:homeIOTLightObjectPattern, t3:___, act:homeIOTLightActionOnPattern, t4:___}] :=
Module[{rul = <|"Location"->loc, "Object"->obj, "Action"->True, "Brightness"->Null|>},
rul["Location"]=loc/.homeIOTLightLocationMapping; rul["Object"]=obj/.homeIOTLightObjectMapping;
userJson["HomeIOT"]["Light"]=rul; userJson["TaskType"]=1;userJson["TTS"]=StringJoin[{loc, kstr["의 "], obj, kstr["이 켜졌습니다"]}];userJson["HomeIOT"]["HomeIOTType"]=1;"light on! pattern1"]
commandRun[{t1:___, obj:homeIOTLightObjectPattern, t2:___, act:homeIOTLightActionOnPattern, t3:___, loc:homeIOTLightLocationPattern, t4:___}] :=
Module[{rul = <|"Location"->loc, "Object"->obj, "Action"->True, "Brightness"->Null|>},
rul["Location"]=loc/.homeIOTLightLocationMapping; rul["Object"]=obj/.homeIOTLightObjectMapping;
userJson["HomeIOT"]["Light"]=rul; userJson["TaskType"]=1;userJson["TTS"]=StringJoin[{loc, kstr["의 "], obj, kstr["이 켜졌습니다"]}];userJson["HomeIOT"]["HomeIOTType"]=1;"light on! pattern2"]
commandRun[{t1:___, loc:homeIOTLightLocationPattern, t2:___, obj:homeIOTLightObjectPattern, t3:___, act:homeIOTLightActionOffPattern, t4:___}] :=
Module[{rul = <|"Location"->loc, "Object"->obj, "Action"->False, "Brightness"->Null|>},
rul["Location"]=loc/.homeIOTLightLocationMapping; rul["Object"]=obj/.homeIOTLightObjectMapping;
userJson["HomeIOT"]["Light"]=rul; userJson["TaskType"]=1;userJson["TTS"]=StringJoin[{loc, kstr["의 "], obj, kstr["이 꺼졌습니다"]}];userJson["HomeIOT"]["HomeIOTType"]=1;"light off! pattern1"]
commandRun[{t1:___, obj:homeIOTLightObjectPattern, t2:___, act:homeIOTLightActionOffPattern, t3:___, loc:homeIOTLightLocationPattern, t4:___}] :=
Module[{rul = <|"Location"->loc, "Object"->obj, "Action"->False, "Brightness"->Null|>},
rul["Location"]=loc/.homeIOTLightLocationMapping; rul["Object"]=obj/.homeIOTLightObjectMapping;
userJson["HomeIOT"]["Light"]=rul; userJson["TaskType"]=1;userJson["TTS"]=StringJoin[{loc, kstr["의 "], obj, kstr["이 꺼졌습니다"]}];userJson["HomeIOT"]["HomeIOTType"]=1;"light off! pattern2"]

(* print command function status *)
??commandRun


(* run pattern matching function *)
Print["----- run command function"]
commandRun[morphList]//Print


(* print result json *)
Print["----- json result"]
userJson//Print


(* todo : socket programming for send json result *)
ExportString[userJson, "RawJSON"]//Print

