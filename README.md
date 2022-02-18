<img src="https://github.com/varjakw/ToYCompiler/blob/main/ToYCompiler.jpg" width="960" height="270" />

# ToY Language Compiler
Goal: to implement a parser and type-checker for the ToY language. Using tools flex and bison with Java.

## Syntax
- Reserved words: ```bool```, ```int```, ```true```, ```false```, ```void```, ```printf```, ```string```, ```struct```, ```if```, ```then```, ```else```, ```for```, ```return```.
- Identifier ```<id>```: a (case-sensitive )sequence of one or more letters/digits/underscores, starting with a letter or underscore and cannot be a reserved word.
- Integer literals: a 16 bit sequence of one or more digits (from -32768 to 32767), potentially starting with minus symbol. ToY does not have float numbers.
- String literals: a sequence of zero or more characters, surrounded by double quotation marks. ToY does not support escaped characters like "Hello \"world\"!".
- Symbols: ```{```, ```}```, ```;```, ```<```, ```>```, ```==```, ```<-```, ```>-```, ```!=```, ```!```, ```(```, ```)```, ```+```, ```-```, ```.```, ```=```,  ```*```,  ```/```,  ```mod```,  ```and```,  ```or```,  ```not```, ```>```,  ```<```,  ```>=```,  ```<=```. 
- Comments: Done using ```//``` or ```##```

## Types

- Basic data types ```int```, ```bool```, ```string```.
- ```<type> ::= int | bool | string```
- Procedures can also return void or one of the above
- ```<return-type> ::= <type> | void```
- Can also defines record types (structs) with the syntax
- ```<struct> ::= struct <id> {<declaration>,<declaration>,... }
- Note that a struct has at least one declaration in it and that they are comma-seperated. Declarations are given by the grammar: ```<declaration> ::= <type> <id>```

## Notes
- See spec.pdf for further details on statements, expressions and program structure.
