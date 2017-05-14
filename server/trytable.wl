#!/usr/bin/env wolframscript

kstr[str:_] := FromCharacterCode[ImportString[str,"Byte"],"UTF-8"]
kstr[list:_List] := kstr/@list

homeIOTLightLocationPattern = kstr[{"거실", "안방", "화장실", "부엌"}]
homeIOTLightObjectPattern = kstr[{"불", "조명"}]
homeIOTLightActionPattern = kstr[{"킬", "켜", "켜볼", "켤", "켜기"}]

result = FromCharacterCode[ImportString[ReadString["temp.txt"],"Byte"], "UTF-8"]
result//Print

morphList = StringSplit[result,","]
morphList//Print

(*
runCommand[{t1:___, loc:homeIOTLightLocationPattern, t2:___, obj:homeIOTLightObjectPatten, t3:__$runCommand[default:_] := "unknown pattern"
*)


patternTable = Table[
asd[{t1:___, loc:homeIOTLightLocationPattern[[l]], 
t2:___, obj:homeIOTLightObjectPattern[[o]], 
t3:___, act:homeIOTLightActionPattern[[a]], t4:___}],
{l,Length[homeIOTLightLocationPattern]},
{o,Length[homeIOTLightObjectPattern]},
{a,Length[homeIOTLightActionPattern]}]

patternTable = Flatten[patternTable]
asd[x:_]=x

Table[runCommand[patternTable[[x]]]=x, {x,Length[patternTable]}]

runCommand[morphList]//Print





