#!/usr/bin/env wolframscript

sentence = FromCharacterCode[ImportString[$ScriptCommandLine[[2]], "Byte"],"UTF-8"]
Print["Sentence : "~~sentence]

template = StringTemplate["`python` morph.py \"`sentence`\""]
commandString := TemplateApply[template, <|"python"->"python", "sentence"->sentence |>]

commandString//Print
Run[commandString]

result = FromCharacterCode[ImportString[ReadString["temp.txt"],"Byte"], "UTF-8"]
result//Print
