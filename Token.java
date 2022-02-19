
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
    KEYWORD,IDENTIFIER,STRING,INTEGER,OPERATOR, LEFT_BRACK, RIGHT_BRACK,
    LEFT_CURLY_BRACK, RIGHT_CURLY_BRACK
}