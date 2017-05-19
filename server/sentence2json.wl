#!/usr/bin/env wolframscript

(* for korean string *)
Kstr[str:_] := FromCharacterCode[ImportString[str,"Byte"],"UTF-8"]
Kstr[a:_->b:_] := Kstr[a]->Kstr[b]
Kstr[list:_List] := Kstr/@list
Kstr[num:_Number] := num


(* Q number pattern *)
QnumberPattern = "Q"~~NumberString


(* default function *)
RunCommand[unknown:_] := "unknown pattern catched..."


(* define funciton template *)
FuncTemplate := (RunCommand[s_String /; StringMatchQ[s, #1]] := Module[{param = Flatten[StringCases[s, #1->#2]]}, #3[param]])&


(* import function *)
Get["module/homeIOTLight.wl"]


(* read protocol json file *)
DefaultJson = Import["../corpus/protocol.json", "RawJSON"]


(* read user input *)
Sentence = Kstr[$ScriptCommandLine[[2]]]
Print["sentence : ", Sentence]


(* run function *)
ResultJson = RunCommand[Sentence]
print[ResultJson]

(* json result *)
Print[ExportString[ResultJson,"RawJSON"]]

