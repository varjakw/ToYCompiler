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
- ```<struct> ::= struct <id> {<declaration>,<declaration>,... }```
- Note that a struct has at least one declaration in it and that they are comma-seperated. Declarations are given by the grammar: ```<declaration> ::= <type> <id>```

## Notes
- See spec.pdf for further details on statements, expressions and program structure.

# Part 1
Lexical Analyser/Scanner for the ToY language. Returns ```VALID``` or ```ERROR```.

- Input is characters from source programs
- Output is sequence of tokens

The lex analyser divides the program into tokens. A token is a sequence of characters that can be treated as a unit in the grammar of the language.

Examples:
- Type (id, number, real,...)
- Punctuation tokens (If, void, return,...)
- Alphabetic tokens (keywords)
  
    
    
- Keywords include for, while, if, etc 
- Identifiers include variable names, function names, etc
- Operators include +, -, etc
- Seperators like ',' and ';'

## How Lexical Analysis Works
- Tokenization: dividing the program into valid tokens
- Remove white space
- Remove comments
- Identifies error using the grammar of the given languages.

### Examples
- Keywords
  - ```else = 'e' 'l' 's' 'e'```
  - Set of Keywords: ```'else' + 'if' + 'int' + ...```
- Integers
  - digit: ```'0' | '1' | ... | '9'```
  - integers: ```digit digit* (or digit+) ```
  - hexadecimal (starts with 0x or 0X): ```'0' | ('x' | 'X')hexdigit+``` where ```hexdigit = digit|'a'|'b'|'c'|'d'|'e'|'f'|'A'...|'F'```
- Identifier
  - letter: ```'a' | ... | 'z' | 'A' | ... | 'Z'```
  - identifiers: ```letter (letter|digit)*```
- Single-line comments
  - //this is a comment
  - ```('/' | '#')('/' | '#') not(\n)* (\n|epsilon)```

We are representing the tokens using regular expressions.

# Code Stuff
Lex file format:  

![image](https://user-images.githubusercontent.com/78870995/154807461-6827cf04-2408-4ef1-a1d4-d69db358b563.png)

