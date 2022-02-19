
class Token {
    TokenType type;
    String text;
    Token(String t, TokenType type) {
        this.text = t;
        this.type = type;
    }
    public String toString() {
        return String.format("%s %s", type, text);
    }
}

enum TokenType {
    KEYWORD,IDENTIFIER,STRING,INTEGER,PLUS,MINUS,MULTIPLY,DIVIDE, EQUALS,SEMICOLON, LEFT_BRACKET, RIGHT_BRACKET,COMMA,COLON, LOWER_THAN_OR_EQUAL, GREATER_THAN_OR_EQUAL, NOT_EQUAL, GREATER_THAN, LOWER_THAN,
    LEFT_CURLY_BRACKET, RIGHT_CURLY_BRACKET
}