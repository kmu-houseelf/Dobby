#!/usr/bin/env wolframscript

(* read korean string *)
kstr[str:_] := FromCharacterCode[ImportString[str,"Byte"],"UTF-8"]
kstr[list:_List] := kstr/@list


(* define pattern *)
homeIOTLightLocationPattern = (kstr["거실"] | kstr["안방"] | kstr["화장실"] | kstr["부엌"])
homeIOTLightObjectPattern = kstr["불"] | kstr["조명"]
homeIOTLightActionOnPattern = (kstr["킬"] | kstr["켜"] | kstr["켜볼"] | kstr["켤"] | kstr["켜기"])


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
(*{
"TaskType" : "Number",
"TTS" : "String",
"HomeIOT" : 
{
"HomeIOTType" : "Number",
"Light":
{
"Location" : "String",
"Object" : "String",
"Action" : "Boolean",
"Brightness" : "Boolean"
}
}
}*)
commandRun[{t1:___, loc:homeIOTLightLocationPattern, t2:___, obj:homeIOTLightObjectPattern, t3:___, act:homeIOTLightActionOnPattern, t4:___}] :=
Module[{rul = <|"Location"->loc, "Object"->obj, "Action"->True, "Brightness"->Null|>},
rul["Location"]=loc; rul["Object"]=obj; 
userJson["HomeIOT"]["Light"]=rul; userJson["TaskType"]=1;userJson["TTS"]=kstr["거실의 불이 켜졌습니다"];userJson["HomeIOT"]["HomeIOTType"]=1]


(* print command function status *)
??commandRun


(* run pattern matching function *)
Print["----- run command function"]
commandRun[morphList]//Print


(* print result json *)
Print["----- json result"]
userJson//Print


(* todo : socket programming for send json result *)
(*ExportString[userJson, "RawJSON"]//Print*)
