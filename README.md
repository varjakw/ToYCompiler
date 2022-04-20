<img src="https://github.com/varjakw/ToYCompiler/blob/main/ToYCompiler.jpg" width="960" height="270" />

# ToY Language Compiler
Goal: to implement a parser and type-checker for the ToY language. Using tools flex and bison with Java.

## Syntax
- Reserved words: ```bool```, ```int```, ```true```, ```false```, ```void```, ```printf```, ```string```, ```struct```, ```if```, ```then```, ```else```, ```for```, ```return```, ```mod```, ```and```, ```or```.
- Identifier ```<id>```: a (case-sensitive )sequence of one or more letters/digits/underscores, starting with a letter or underscore and cannot be a reserved word.
- Integer literals: a 16 bit sequence of one or more digits (from -32768 to 32767), potentially starting with minus symbol. ToY does not have float numbers.
- String literals: a sequence of zero or more characters, surrounded by double quotation marks. ToY does not support escaped characters like "Hello \"world\"!".
- Symbols: ```{```, ```}```, ```;```, ```<```, ```>```, ```==```, ```<-```, ```>-```, ```!=```, ```!```, ```(```, ```)```, ```+```, ```-```, ```.```, ```=```,  ```*```,  ```/```, ```*```, ```>```,  ```<```,  ```>=```,  ```<=```. 
- Comments: Done using ```//``` or ```##```

## Types

- Basic data types ```int```, ```bool```, ```string```.
- ```<type> ::= int | bool | string```
- Procedures can also return void or one of the above
- ```<return-type> ::= <type> | void```
- Can also defines record types (structs) with the syntax
- ```<struct> ::= struct <id> {<declaration>,<declaration>,... }```
- Note that a struct has at least one declaration in it and that they are comma-seperated. Declarations are given by the grammar: ```<declaration> ::= <type> <id>```

## Notes
- See spec.pdf for further details on statements, expressions and program structure.

# Part 1 - Flex
Lexical Analyser/Scanner for the ToY language. Returns ```VALID``` or ```ERROR```.

- Input is characters from source programs
- Output is sequence of tokens

The lex analyser divides the program into tokens. A token is a sequence of characters that can be treated as a unit in the grammar of the language.

## How Lexical Analysis Works
- Tokenization: dividing the program into valid tokens
- Remove white space
- Remove comments
- Identifies error using the grammar of the given languages.

We are representing the tokens using regular expressions.

# Part 2 - Parser - Bison
 The product of semantic parsing with bison is an AST.
We deal with Context-Free Grammer (CFG) here in order to output an Abstract Syntax Tree (AST).

## Context-Free Grammar
A context-free grammar (CFG) consisting of a finite set of grammar rules is a quadruple (N, T, P, S) where

-N is a set of non-terminal symbols.
-T is a set of terminals where N ∩ T = NULL.
-P is a set of rules, P: N → (N ∪ T)\*, the left-hand side of the production rule P does have any right context or left context.
-S is the start symbol.

### Production rules
![image](https://user-images.githubusercontent.com/78870995/159086370-37d3fa33-13d1-47c1-9273-4c46fdf2e248.png)


## Derivation 
Derivation is a sequence of production rules. It is used to get the input string through these production rules. 

To parse, we have to make two decisions:
-We have to decide the non-terminal which is to be replaced.
-We have to decide the production rule by which the non-terminal will be replaced.

## Parse Tree
A parse tree is the graphical representation of a symbol. The root of the parse tree is the start node from which we derive the string.

Note:
-All leaf nodes have to be terminals.
-All interior nodes have to be non-terminals.

## Amiguity
A grammar is ambiguous if there exists more than one leftmost derivation or more than one rightmost derivative or more than one parse tree for the given input string.

# Code Stuff
Lex file format:  

![image](https://user-images.githubusercontent.com/78870995/154810655-ac4e6935-7b3c-46f5-b828-95ba73439016.png)


Running lexer & parser together

![image](https://user-images.githubusercontent.com/78870995/154808126-9fa816d0-f9e3-4d93-ab31-5fba07edf864.png)




