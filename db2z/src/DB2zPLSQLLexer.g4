/*

This is intended to be an ANTLR4 grammar for DB2Z DSNUTILU, ADMIN_COMMAND_DSN and ADMIN_COMMAND_DB2 calls.

I am heavily indebted to Craig Schneiderwent while building this ANTLR file. I used his https://github.com/cschneid-the-elder/mapa to build upon.
However, all inconsistencies, flaws and irrational decisions, if any, are mine.

Based on IBM DB2Z 12 syntax.

The parser/lexer files are far from complete as compared to the endless possibilities IBM offers
They only contain the now needed syntax. I probably need to make more additions in the near future.

There are some TODO's in the code. These need to be addressed too.

Martijn Rutte / opales@zonnet.nl

*/


lexer grammar DB2zPLSQLLexer;

@lexer::members {
	public String statementTerminator = new String("");
}

channels { COMMENTS }

fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');
fragment AMPERSAND
	: '&';

ADMIN_COMMAND_DSN
	: A D M I N '_' C O M M A N D '_' D S N
	->pushMode(ADMIN_COMMAND_DSN_MODE)
	;

ADMIN_COMMAND_DB2
	: A D M I N '_' C O M M A N D '_' D B '2'
	->pushMode(ADMIN_COMMAND_DB2_MODE)
	;

DSNUTILU
	: D S N U T I L U
	->pushMode(DSNUTILU_MODE)
	;

LPAREN
	: '('
	;

RPAREN
	: ')'
	;

SIMPLEQUOTE
	: '\''
	;

OPENSQBRACKET
	: '['
	;

CLOSESQBRACKET
	: ']'
	;

QUESTIONMARK
	: '?' {!getText().equals(statementTerminator)}?
	;

EQ
	: '='
	;

GT
	: '>'
	;

LT
	: '<'
	;

GE
	: GT EQ
	;

LE
	: LT EQ
	;

NE
	: LT GT
	;

PLUS
	: '+'
	;

MINUS
	: '-'
	;

SPLAT
	: '*'
	;

SLASH
	: '/'
	;

CONCATOP
	: '||'
	;

DOT
	: '.'
	;

COLON
	: ':'
	;

SEMICOLON
	: ';'
	;

COMMA
	: ','
	;

NONNUMERICLITERAL
	: STRINGLITERAL
	| HEXLITERAL
	;

fragment HEXLITERAL
	: X '"' [0-9A-F]+ '"'
	| X '\'' [0-9A-F]+ '\''
	;

fragment STRINGLITERAL
	: '"' (~["] | '""' | '\'')* '"'
	| '\'' (~['] | '\'\'' | '"')* '\''
	;

INTEGERLITERAL
	: (PLUS | MINUS)? [0-9]+
	;

NUMERICLITERAL
	: (PLUS | MINUS)? [0-9]* DOT [0-9]+ (('e' | 'E') (PLUS | MINUS)? [0-9]+)?
	;

NEWLINE
	: [\n\r]
	->channel(HIDDEN)
	;

WS
	: [ \t]+
	->channel(HIDDEN)
	;


/*
For those who need to process SQL that is not embedded
in application source code, provision is made for the
SPUFI command to set the SQL statement terminator.
*/
SET_STATEMENT_TERMINATOR
	: '--#SET' WS 'TERMINATOR' WS ~[\n\r] WS? NEWLINE
	{
		String text = getText();
		String textStripped = text.stripTrailing();
		statementTerminator = new String(textStripped.substring(textStripped.length() - 1));
	}
	->channel(COMMENTS)
	;

SQLCOMMENT
	: (('--' ~[\n\r]* NEWLINE?)
	| (SLASH SPLAT .*? SPLAT SLASH))
	->channel(COMMENTS)
	;

SQLBLOCKCOMMENTBEGIN
	: SLASH SPLAT
	;

SQLBLOCKCOMMENTEND
	: SPLAT SLASH
	;

INSTEAD
	: I N S T E A D 
	;

NEW
	: N E W 
	;

NEW_TABLE
	: N E W '_' T A B L E 
	;

OLD_TABLE
	: O L D '_' T A B L E 
	;

REFERENCING
	: R E F E R E N C I N G 
	;

BASED
	: B A S E D
	;

UPON
	: U P O N
	;

//generated sql lexer keywords

ADD
	: A D D 
	;

AFTER
	: A F T E R 
	;

ALL
	: A L L 
	;

ALLOCATE
	: A L L O C A T E 
	;

ALLOW
	: A L L O W 
	;

ALTER
	: A L T E R
	;

ALTERAND
	: A L T E R A N D 
	;

ANY
	: A N Y 
	;

ARRAY
	: A R R A Y 
	;

ARRAY_EXISTS
	: A R R A Y '_' E X I S T S 
	;

AS
	: A S 
	;

ASENSITIVE
	: A S E N S I T I V E 
	;

ASSOCIATE
	: A S S O C I A T E 
	;

ASUTIME
	: A S U T I M E 
	;

AT
	: A T 
	;

AUDIT
	: A U D I T 
	;

AUX
	: A U X 
	;

AUXILIARY
	: A U X I L I A R Y 
	;

BEFORE
	: B E F O R E 
	;

BEGIN
	: B E G I N 
	;

BETWEEN
	: B E T W E E N 
	;

BUFFERPOOL
	: B U F F E R P O O L 
	;

BUFFERPOOLS
	: B U F F E R P O O L S
	;

BY
	: B Y 
	;

CALL
	: C A L L 
	;

CAPTURE
	: C A P T U R E 
	;

CASCADED
	: C A S C A D E D 
	;

CASE
	: C A S E 
	;

CAST
	: C A S T 
	;

CCSID
	: C C S I D 
	;

CHAR
	: C H A R 
	;

CHARACTER
	: C H A R A C T E R 
	;

CHECK
	: C H E C K 
	;

CLONE
	: C L O N E 
	;

CLOSE
	: C L O S E 
	;

CLUSTER
	: C L U S T E R 
	;

COLLECTION
	: C O L L E C T I O N 
	;

COLLID
	: C O L L I D 
	;

COLUMN
	: C O L U M N 
	;

COMMENT
	: C O M M E N T 
	;

COMMIT
	: C O M M I T 
	;

CONCAT
	: C O N C A T 
	;

CONDITION
	: C O N D I T I O N 
	;

CONNECT
	: C O N N E C T 
	;

CONNECTION
	: C O N N E C T I O N 
	;

CONSTRAINT
	: C O N S T R A I N T 
	;

CONTAINS
	: C O N T A I N S 
	;

CONTENT
	: C O N T E N T 
	;

CONTINUE
	: C O N T I N U E 
	;

CREATE
	: C R E A T E 
	;

CUBE
	: C U B E 
	;

CURRENT
	: C U R R E N T 
	;

//CURRENT_LC_CTYPE
//	: C U R R E N T ([ ]+ L O C A L E)? [ ]+ L C '_' C T Y P E 
//	;

CURRVAL
	: C U R R V A L 
	;

CURSOR
	: C U R S O R 
	;

DATA
	: D A T A 
	;

DATABASE
	: D A T A B A S E 
	;

DAY
	: D A Y 
	;

DAYS
	: D A Y S 
	;

DBINFO
	: D B I N F O 
	;

DECLARE
	: D E C L A R E 
	;

DEFAULT
	: D E F A U L T 
	;

DELETE
	: D E L E T E 
	;

DESCRIPTOR
	: D E S C R I P T O R 
	;

DETERMINISTIC
	: D E T E R M I N I S T I C 
	;

DISABLE
	: D I S A B L E 
	;

DISALLOW
	: D I S A L L O W 
	;

DISTINCT
	: D I S T I N C T 
	;

DO
	: D O 
	;

DOCUMENT
	: D O C U M E N T 
	;

DOUBLE
	: D O U B L E 
	;

DROP
	: D R O P 
	;

DSSIZE
	: D S S I Z E 
	;

DYNAMIC
	: D Y N A M I C 
	;

EDITPROC
	: E D I T P R O C 
	;

ELSE
	: E L S E 
	;

ELSEIF
	: E L S E I F 
	;

ENCODING
	: E N C O D I N G 
	;

ENCRYPTION
	: E N C R Y P T I O N 
	;

END
	: E N D 
	;

END_EXEC
	: (E N D '-' E X E C | E N D E X E C)
	;

ENDING
	: E N D I N G 
	;

ERASE
	: E R A S E 
	;

ESCAPE
	: E S C A P E 
	;

EXCEPT
	: E X C E P T 
	;

EXCEPTION
	: E X C E P T I O N 
	;

EXEC_SQL
	: E X E C [ ]+ S Q L
	;

EXECUTE
	: E X E C U T E 
	;

EXISTS
	: E X I S T S 
	;

EXIT
	: E X I T 
	;

EXPLAIN
	: E X P L A I N 
	;

EXTERNAL
	: E X T E R N A L 
	;

FENCED
	: F E N C E D 
	;

FETCH
	: F E T C H 
	;

FIELDPROC
	: F I E L D P R O C 
	;

FINAL
	: F I N A L 
	;

FIRST
	: F I R S T 
	;

FOR
	: F O R 
	;

FREE
	: F R E E 
	;

FROM
	: F R O M 
	;

FULL
	: F U L L 
	;

FUNCTION
	: F U N C T I O N 
	;

GENERATED
	: G E N E R A T E D 
	;

GET
	: G E T 
	;

GLOBAL
	: G L O B A L 
	;

GO
	: G O 
	;

GOTO
	: G O T O 
	;

GRANT
	: G R A N T 
	;

GROUP
	: G R O U P 
	;

HANDLER
	: H A N D L E R 
	;

HAVING
	: H A V I N G 
	;

HOLD
	: H O L D 
	;

HOUR
	: H O U R 
	;

HOURS
	: H O U R S 
	;

IF
	: I F 
	;

IMMEDIATE
	: I M M E D I A T E 
	;

IN
	: I N 
	;

INCLUSIVE
	: I N C L U S I V E 
	;

INDEX
	: I N D E X 
	;

INDEXBP
	: I N D E X B P
	;

INHERIT
	: I N H E R I T 
	;

INNER
	: I N N E R 
	;

INOUT
	: I N O U T 
	;

INSENSITIVE
	: I N S E N S I T I V E 
	;

INSERT
	: I N S E R T 
	;

INTERSECT
	: I N T E R S E C T 
	;

INTO
	: I N T O 
	;

IS
	: I S 
	;

ISOBID
	: I S O B I D 
	;

ITERATE
	: I T E R A T E 
	;

JAR
	: J A R 
	;

JOIN
	: J O I N 
	;

KEEP
	: K E E P 
	;

KEY
	: K E Y 
	;

LABEL
	: L A B E L 
	;

LANGUAGE
	: L A N G U A G E 
	;

LAST
	: L A S T 
	;

LC_CTYPE
	: L C '_' C T Y P E 
	;

LEAVE
	: L E A V E 
	;

LEFT
	: L E F T 
	;

LIKE
	: L I K E 
	;

LIMIT
	: L I M I T 
	;

LOCAL
	: L O C A L 
	;

LOCALE
	: L O C A L E 
	;

LOCATOR
	: L O C A T O R 
	;

LOCATORS
	: L O C A T O R S 
	;

LOCK
	: L O C K 
	;

LOCKMAX
	: L O C K M A X 
	;

LOCKSIZE
	: L O C K S I Z E 
	;

LONG
	: L O N G 
	;

LOOP
	: L O O P 
	;

MAINTAINED
	: M A I N T A I N E D 
	;

MATERIALIZED
	: M A T E R I A L I Z E D 
	;

MICROSECOND
	: M I C R O S E C O N D 
	;

MICROSECONDS
	: M I C R O S E C O N D S 
	;

MINUTEMINUTES
	: M I N U T E M I N U T E S 
	;

MODEL
	: M O D E L
	;

MODIFIES
	: M O D I F I E S 
	;

MONTH
	: M O N T H 
	;

MONTHS
	: M O N T H S 
	;

NEXT
	: N E X T 
	;

NEXTVAL
	: N E X T V A L 
	;

NO
	: N O 
	;

NONE
	: N O N E 
	;

NOT
	: N O T 
	;

NULL
	: N U L L 
	;

NULLS
	: N U L L S 
	;

NUMPARTS
	: N U M P A R T S 
	;

OBID
	: O B I D 
	;

OF
	: O F 
	;

OFFSET
	: O F F S E T 
	;

OLD
	: O L D 
	;

ON
	: O N 
	;

OPEN
	: O P E N 
	;

OPTIMIZATION
	: O P T I M I Z A T I O N 
	;

OPTIMIZE
	: O P T I M I Z E 
	;

OR
	: O R 
	;

ORDER
	: O R D E R 
	;

ORGANIZATION
	: O R G A N I Z A T I O N 
	;

OUT
	: O U T 
	;

OUTER
	: O U T E R 
	;

PACKAGE
	: P A C K A G E 
	;

PADDED
	: P A D D E D 
	;

PARAMETER
	: P A R A M E T E R 
	;

PART
	: P A R T 
	;

PARTITION
	: P A R T I T I O N 
	;

PARTITIONED
	: P A R T I T I O N E D 
	;

PARTITIONING
	: P A R T I T I O N I N G 
	;

PATH
	: P A T H 
	;

PERIOD
	: P E R I O D 
	;

PIECESIZE
	: P I E C E S I Z E 
	;

PLAN
	: P L A N 
	;

PRECISION
	: P R E C I S I O N 
	;

PREPARE
	: P R E P A R E 
	;

PREVVAL
	: P R E V V A L 
	;

PRIOR
	: P R I O R 
	;

PRIQTY
	: P R I Q T Y 
	;

PRIVILEGES
	: P R I V I L E G E S 
	;

PROCEDURE
	: P R O C E D U R E 
	;

PROGRAM
	: P R O G R A M 
	;

PSID
	: P S I D 
	;

PUBLIC
	: P U B L I C 
	;

QUERY
	: Q U E R Y 
	;

QUERYNO
	: Q U E R Y N O 
	;

READS
	: R E A D S 
	;

REFERENCES
	: R E F E R E N C E S 
	;

REFRESH
	: R E F R E S H 
	;

RELEASE
	: R E L E A S E 
	;

RENAME
	: R E N A M E 
	;

REPEAT
	: R E P E A T 
	;

RESIGNAL
	: R E S I G N A L 
	;

RESTRICT
	: R E S T R I C T 
	;

RESULT
	: R E S U L T 
	;

RESULT_SET_LOCATOR
	: R E S U L T '_' S E T '_' L O C A T O R 
	;

RETURN
	: R E T U R N 
	;

RETURNS
	: R E T U R N S 
	;

REUSE
	: R E U S E
	;

REVOKE
	: R E V O K E 
	;

RIGHT
	: R I G H T 
	;

ROLE
	: R O L E 
	;

ROLLBACK
	: R O L L B A C K 
	;

ROLLUP
	: R O L L U P 
	;

ROUND_CEILING
	: R O U N D '_' C E I L I N G 
	;

ROUND_DOWN
	: R O U N D '_' D O W N 
	;

ROUND_FLOOR
	: R O U N D '_' F L O O R 
	;

ROUND_HALF_DOWN
	: R O U N D '_' H A L F '_' D O W N 
	;

ROUND_HALF_EVEN
	: R O U N D '_' H A L F '_' E V E N 
	;

ROUND_HALF_UP
	: R O U N D '_' H A L F '_' U P 
	;

ROUND_UP
	: R O U N D '_' U P 
	;

ROW
	: R O W 
	;

ROWSET
	: R O W S E T 
	;

RUN
	: R U N 
	;

SAVEPOINT
	: S A V E P O I N T 
	;

SCHEMA
	: S C H E M A 
	;

SCRATCHPAD
	: S C R A T C H P A D 
	;

SECOND
	: S E C O N D 
	;

SECONDS
	: S E C O N D S 
	;

SECQTY
	: S E C Q T Y 
	;

SECURITY
	: S E C U R I T Y 
	;

SELECT
	: S E L E C T 
	;

SENSITIVE
	: S E N S I T I V E 
	;

SEQUENCE
	: S E Q U E N C E 
	;

SET
	: S E T 
	;

SIGNAL
	: S I G N A L 
	;

SIMPLE
	: S I M P L E 
	;

SOME
	: S O M E 
	;

SOURCE
	: S O U R C E 
	;

SPECIFIC
	: S P E C I F I C 
	;

STANDARD
	: S T A N D A R D 
	;

STATEMENT
	: S T A T E M E N T 
	;

STATIC
	: S T A T I C 
	;

STAY
	: S T A Y 
	;

STOGROUP
	: S T O G R O U P 
	;

STORAGE
	: S T O R A G E
	;

STORES
	: S T O R E S 
	;

STYLE
	: S T Y L E 
	;

SUMMARY
	: S U M M A R Y 
	;

SYNONYM
	: S Y N O N Y M 
	;

SYSDATE
	: S Y S D A T E 
	;

SYSPROC
	: S Y S P R O C
	;

SYSTEM
	: S Y S T E M 
	;

SYSTIMESTAMP
	: S Y S T I M E S T A M P 
	;

TABLE
	: T A B L E 
	;

TABLESPACE
	: T A B L E S P A C E 
	;

THEN
	: T H E N 
	;

TO
	: T O 
	;

TRIGGER
	: T R I G G E R 
	;

TRIGGERS
	: T R I G G E R S
	;

TRUNCATE
	: T R U N C A T E 
	;

TYPE
	: T Y P E 
	;

UNDO
	: U N D O 
	;

UNION
	: U N I O N 
	;

UNIQUE
	: U N I Q U E 
	;

UNTIL
	: U N T I L 
	;

UPDATE
	: U P D A T E 
	;

USING
	: U S I N G 
	;

VALIDPROC
	: V A L I D P R O C 
	;

VALUE
	: V A L U E 
	;

VALUES
	: V A L U E S 
	;

VARIABLE
	: V A R I A B L E 
	;

VARIANT
	: V A R I A N T 
	;

VCAT
	: V C A T 
	;

VERSIONING
	: V E R S I O N I N G 
	;

VIEW
	: V I E W 
	;

VOLATILE
	: V O L A T I L E 
	;

VOLUMES
	: V O L U M E S 
	;

WHEN
	: W H E N 
	;

WHENEVER
	: W H E N E V E R 
	;

WHERE
	: W H E R E 
	;

WHILE
	: W H I L E 
	;

WITH
	: W I T H 
	;

WLM
	: W L M 
	;

XMLCAST
	: X M L C A S T 
	;

XMLEXISTS
	: X M L E X I S T S 
	;

XMLNAMESPACES
	: X M L N A M E S P A C E S 
	;

YEAR
	: Y E A R 
	;

YEARS
	: Y E A R S 
	;

ZONE
	: Z O N E 
	;

TIMEZONE
	: T I M E Z O N E
	;

AND
	: A N D 
	;

ARRAY_AGG
	: A R R A Y '_' A G G 
	;

ASC
	: A S C 
	;

AVG
	: A V G 
	;

BIT
	: B I T 
	;

CHANGE
	: C H A N G E 
	;

CODEUNITS16
	: C O D E U N I T S '1' '6' 
	;

CODEUNITS32
	: C O D E U N I T S '3' '2' 
	;

CORR
	: C O R R 
	;

CORRELATION
	: C O R R E L A T I O N 
	;

COUNT
	: C O U N T 
	;

COUNT_BIG
	: C O U N T '_' B I G 
	;

COVAR
	: C O V A R 
	;

COVARIANCE
	: C O V A R I A N C E 
	;

COVARIANCE_SAMP
	: C O V A R I A N C E '_' S A M P 
	;

COVAR_POP
	: C O V A R '_' P O P 
	;

COVAR_SAMP
	: C O V A R '_' S A M P 
	;

CS
	: C S 
	;

CUME_DIST
	: C U M E '_' D I S T 
	;

DENSE_RANK
	: D E N S E '_' R A N K 
	;

DESC
	: D E S C 
	;

EBCDIC
	: E B C D I C 
	;

EXCLUSIVE
	: E X C L U S I V E 
	;

FIRST_VALUE
	: F I R S T '_' V A L U E 
	;

FOLLOWING
	: F O L L O W I N G 
	;

GROUPING
	: G R O U P I N G 
	;

IGNORE
	: I G N O R E 
	;

INDICATOR
	: I N D I C A T O R 
	;

INPUT
	: I N P U T 
	;

ISNULL
	: I S N U L L 
	;

LAG
	: L A G 
	;

LARGE
	: L A R G E 
	;

LAST_VALUE
	: L A S T '_' V A L U E 
	;

LEAD
	: L E A D 
	;

LISTAGG
	: L I S T A G G 
	;

LOCKED
	: L O C K E D 
	;

LOCKS
	: L O C K S 
	;

MEDIAN
	: M E D I A N 
	;

MINUTES
	: M I N U T E S 
	;

MIXED
	: M I X E D 
	;

NOTNULL
	: N O T N U L L 
	;

NTH_VALUE
	: N T H '_' V A L U E 
	;

NTILE
	: N T I L E 
	;

NUMERIC
	: N U M E R I C 
	;

OBJECT
	: O B J E C T 
	;

OCTETS
	: O C T E T S 
	;

ONLY
	: O N L Y 
	;

OVER
	: O V E R 
	;

PASSING
	: P A S S I N G 
	;

PERCENTILE_CONT
	: P E R C E N T I L E '_' C O N T 
	;

PERCENTILE_DISC
	: P E R C E N T I L E '_' D I S C 
	;

PERCENT_RANK
	: P E R C E N T '_' R A N K 
	;

PRECEDING
	: P R E C E D I N G 
	;

PREVIOUS
	: P R E V I O U S 
	;

RANGE
	: R A N G E 
	;

RANK
	: R A N K 
	;

RATIO_TO_REPORT
	: R A T I O '_' T O '_' R E P O R T 
	;

READ
	: R E A D 
	;

REF
	: R E F 
	;

REGR_AVGX
	: R E G R '_' A V G X 
	;

REGR_AVGY
	: R E G R '_' A V G Y 
	;

REGR_COUNT
	: R E G R '_' C O U N T 
	;

REGR_ICPT
	: R E G R '_' I C P T 
	;

REGR_INTERCEPT
	: R E G R '_' I N T E R C E P T 
	;

REGR_R2
	: R E G R '_' R '2' 
	;

REGR_SLOPE
	: R E G R '_' S L O P E 
	;

REGR_SXX
	: R E G R '_' S X X 
	;

REGR_SXY
	: R E G R '_' S X Y 
	;

REGR_SYY
	: R E G R '_' S Y Y 
	;

RESPECT
	: R E S P E C T 
	;

ROW_NUMBER
	: R O W '_' N U M B E R 
	;

ROWS
	: R O W S 
	;

RR
	: R R 
	;

RS
	: R S 
	;

SBCS
	: S B C S 
	;

SELECTIVITY
	: S E L E C T I V I T Y 
	;

SETS
	: S E T S 
	;

SHARE
	: S H A R E 
	;

SKIP_
	: S K I P 
	;

STDDEV
	: S T D D E V 
	;

STDDEV_POP
	: S T D D E V '_' P O P 
	;

STDDEV_SAMP
	: S T D D E V '_' S A M P 
	;

SUM
	: S U M 
	;

TOKEN
	: T O K E N 
	;

UNBOUNDED
	: U N B O U N D E D 
	;

UNPACK
	: U N P A C K 
	;

UR
	: U R 
	;

USE
	: U S E 
	;

VAR
	: V A R 
	;

VARIANCE
	: V A R I A N C E 
	;

VARIANCE_SAMP
	: V A R I A N C E '_' S A M P 
	;

VAR_POP
	: V A R '_' P O P 
	;

VAR_SAMP
	: V A R '_' S A M P 
	;

VARYING
	: V A R Y I N G 
	;

WITHOUT
	: W I T H O U T 
	;

XML
	: X M L 
	;

XMLAGG
	: X M L A G G 
	;

COLUMNS
	: C O L U M N S
	;

SQLID
	: S Q L I D
	;

ORDINALITY
	: O R D I N A L I T Y
	;

SYSTEM_TIME
	: S Y S T E M '_' T I M E
	;

BUSINESS_TIME
	: B U S I N E S S '_' T I M E
	;

MULTIPLIER
	: M U L T I P L I E R
	;

UNNEST
	: U N N E S T
	;

CROSS
	: C R O S S
	;

CALLER
	: C A L L E R
	;

CLIENT
	: C L I E N T
	;

POSITIONING
	: P O S I T I O N I N G
	;

SCROLL
	: S C R O L L
	;

ACTION
	: A C T I O N 
	;

ASSEMBLE
	: A S S E M B L E 
	;

C_
	: C 
	;

CALLED
	: C A L L E D 
	;

COBOL
	: C O B O L 
	;

DB2
	: D B '2' 
	;

DEFINER
	: D E F I N E R 
	;

DISPATCH
	: D I S P A T C H 
	;

ENVIRONMENT
	: E N V I R O N M E N T 
	;

FAILURE
	: F A I L U R E 
	;

FAILURES
	: F A I L U R E S 
	;

JAVA
	: J A V A 
	;

MAIN
	: M A I N 
	;

NAME
	: N A M E 
	;

OPTIONS
	: O P T I O N S 
	;

PARALLEL
	: P A R A L L E L 
	;

PLI
	: P L I 
	;

REGISTERS
	: R E G I S T E R S 
	;

RESIDENT
	: R E S I D E N T 
	;

SECURED
	: S E C U R E D 
	;

SPECIAL
	: S P E C I A L 
	;

SQL
	: S Q L 
	;

STOP
	: S T O P 
	;

SUB
	: S U B 
	;

YES
	: Y E S 
	;

APPLICATION
	: A P P L I C A T I O N 
	;

CHANGED
	: C H A N G E D 
	;

COMPATIBILITY
	: C O M P A T I B I L I T Y 
	;

COMPRESS
	: C O M P R E S S 
	;

COPY
	: C O P Y 
	;

FREEPAGE
	: F R E E P A G E 
	;

GBPCACHE
	: G B P C A C H E 
	;

INCLUDE
	: I N C L U D E 
	;

MAXVALUE
	: M A X V A L U E 
	;

MINVALUE
	: M I N V A L U E 
	;

PCTFREE
	: P C T F R E E 
	;

REGENERATE
	: R E G E N E R A T E 
	;

MASK
	: M A S K
	;

ENABLE
	: E N A B L E
	;

PERMISSION
	: P E R M I S S I O N
	;

ATOMIC
	: A T O M I C
	;

SQLEXCEPTION
	: S Q L E X C E P T I O N
	;

MERGE
	: M E R G E
	;

MATCHED
	: M A T C H E D
	;

SQLSTATE
	: S Q L S T A T E
	;

MESSAGE_TEXT
	: M E S S A G E '_' T E X T
	;

OVERRIDING
	: O V E R R I D I N G
	;

PORTION
	: P O R T I O N
	;

DB
	: D B 
	;

DSN
	: D S N 
	;

DB2SQL
	: D B '2' S Q L
	;

DEBUG
	: D E B U G
	;

GENERAL
	: G E N E R A L
	;

MODE_
	: M O D E
	;

REXX
	: R E X X
	;

CACHE
	: C A C H E
	;

CYCLE
	: C Y C L E
	;

INCREMENT
	: I N C R E M E N T
	;

RESTART
	: R E S T A R T
	;

DATACLAS
	: D A T A C L A S
	;

MGMTCLAS
	: M G M T C L A S
	;

REMOVE
	: R E M O V E
	;

STORCLAS
	: S T O R C L A S
	;

ACCESS
	: A C C E S S 
	;

ACTIVATE
	: A C T I V A T E 
	;

ALWAYS
	: A L W A Y S 
	;

APPEND
	: A P P E N D 
	;

ARCHIVE
	: A R C H I V E 
	;

BUSINESS
	: B U S I N E S S 
	;

CASCADE
	: C A S C A D E 
	;

CHANGES
	: C H A N G E S 
	;

CONTROL
	: C O N T R O L 
	;

DEACTIVATE
	: D E A C T I V A T E 
	;

DEFERRED
	: D E F E R R E D 
	;

EACH
	: E A C H 
	;

ENFORCED
	: E N F O R C E D 
	;

EXTRA
	: E X T R A 
	;

FOREIGN
	: F O R E I G N 
	;

HIDDEN_
	: H I D D E N 
	;

HISTORY
	: H I S T O R Y 
	;

ID
	: I D 
	;

IDENTITY
	: I D E N T I T Y 
	;

IMPLICITLY
	: I M P L I C I T L Y 
	;

INITIALLY
	: I N I T I A L L Y 
	;

INLINE
	: I N L I N E 
	;

OPERATION
	: O P E R A T I O N 
	;

ORGANIZE
	: O R G A N I Z E 
	;

OVERLAPS
	: O V E R L A P S 
	;

PACKAGE_NAME
	: P A C K A G E '_' N A M E 
	;

PACKAGE_SCHEMA
	: P A C K A G E '_' S C H E M A 
	;

PACKAGE_VERSION
	: P A C K A G E '_' V E R S I O N 
	;

PRIMARY
	: P R I M A R Y 
	;

RESET
	: R E S E T 
	;

ROTATE
	: R O T A T E 
	;

START
	: S T A R T 
	;

SYSIBM
	: S Y S I B M 
	;

TRANSACTION
	: T R A N S A C T I O N 
	;

XMLSCHEMA
	: X M L S C H E M A
	;

ELEMENT
	: E L E M E N T
	;

URL
	: U R L
	;

NAMESPACE
	: N A M E S P A C E
	;

LOCATION
	: L O C A T I O N
	;

SYSXSR
	: S Y S X S R
	;

ALGORITHM
	: A L G O R I T H M 
	;

FIXEDLENGTH
	: F I X E D L E N G T H 
	;

HUFFMAN
	: H U F F M A N 
	;

LOB
	: L O B 
	;

LOG
	: L O G 
	;

LOGGED
	: L O G G E D 
	;

MAXPARTITIONS
	: M A X P A R T I T I O N S 
	;

MAXROWS
	: M A X R O W S 
	;

MEMBER
	: M E M B E R 
	;

MOVE
	: M O V E 
	;

PAGE
	: P A G E 
	;

PAGENUM
	: P A G E N U M 
	;

PENDING
	: P E N D I N G 
	;

RELATIVE
	: R E L A T I V E 
	;

SEGSIZE
	: S E G S I Z E 
	;

TRACKMOD
	: T R A C K M O D 
	;

ADDRESS
	: A D D R E S S 
	;

ATTRIBUTES
	: A T T R I B U T E S 
	;

AUTHENTICATION
	: A U T H E N T I C A T I O N 
	;

AUTHID
	: A U T H I D 
	;

CONTEXT
	: C O N T E X T 
	;

JOBNAME
	: J O B N A M E 
	;

OWNER
	: O W N E R 
	;

PROFILE
	: P R O F I L E 
	;

QUALIFIER
	: Q U A L I F I E R 
	;

SERVAUTH
	: S E R V A U T H 
	;

TRUSTED
	: T R U S T E D 
	;

SECTION
	: S E C T I O N
	;

ACTIVE
	: A C T I V E
	;

VERSION
	: V E R S I O N
	;

ALIAS
	: A L I A S
	;

WORK
	: W O R K
	;

WORKFILE
	: W O R K F I L E
	;

SYSDEFLT
	: S Y S D E F L T
	;

NULTERM
	: N U L T E R M
	;

STRUCTURE
	: S T R U C T U R E
	;

GENERIC
	: G E N E R I C
	;

TEMPORARY
	: T E M P O R A R Y
	;

DEFER
	: D E F E R 
	;

DEFINE
	: D E F I N E 
	;

EXCLUDE
	: E X C L U D E 
	;

GENERATE
	: G E N E R A T E 
	;

KEYS
	: K E Y S 
	;

XMLPATTERN
	: X M L P A T T E R N 
	;

SIZE
	: S I Z E
	;

EVERY
	: E V E R Y
	;

ABSOLUTE
	: A B S O L U T E
	;

ACCELERATOR
	: A C C E L E R A T O R
	;

EXCLUDING
	: E X C L U D I N G
	;

INCLUDING
	: I N C L U D I N G
	;

DEFAULTS
	: D E F A U L T S
	;

MODIFIERS
	: M O D I F I E R S
	;

OPTION
	: O P T I O N
	;

PRESERVE
	: P R E S E R V E
	;

BOTH
	: B O T H 
	;

DESCRIBE
	: D E S C R I B E 
	;

LABELS
	: L A B E L S 
	;

NAMES
	: N A M E S 
	;

OUTPUT
	: O U T P U T 
	;

EXCHANGE
	: E X C H A N G E
	;

STABILIZED
	: S T A B I L I Z E D 
	;

STMTCACHE
	: S T M T C A C H E 
	;

STMTID
	: S T M T I D 
	;

STMTTOKEN
	: S T M T T O K E N 
	;

STARTING
	: S T A R T I N G
	;

CATALOG_NAME
	: C A T A L O G '_' N A M E 
	;

CONDITION_NUMBER
	: C O N D I T I O N '_' N U M B E R 
	;

CURSOR_NAME
	: C U R S O R '_' N A M E 
	;

DB2_AUTHENTICATION_TYPE
	: D B '2' '_' A U T H E N T I C A T I O N '_' T Y P E 
	;

DB2_AUTHORIZATION_ID
	: D B '2' '_' A U T H O R I Z A T I O N '_' I D 
	;

DB2_CONNECTION_STATE
	: D B '2' '_' C O N N E C T I O N '_' S T A T E 
	;

DB2_CONNECTION_STATUS
	: D B '2' '_' C O N N E C T I O N '_' S T A T U S 
	;

DB2_ENCRYPTION_TYPE
	: D B '2' '_' E N C R Y P T I O N '_' T Y P E 
	;

DB2_ERROR_CODE1
	: D B '2' '_' E R R O R '_' C O D E '1' 
	;

DB2_ERROR_CODE2
	: D B '2' '_' E R R O R '_' C O D E '2' 
	;

DB2_ERROR_CODE3
	: D B '2' '_' E R R O R '_' C O D E '3' 
	;

DB2_ERROR_CODE4
	: D B '2' '_' E R R O R '_' C O D E '4' 
	;

DB2_GET_DIAGNOSTICS_DIAGNOSTICS
	: D B '2' '_' G E T '_' D I A G N O S T I C S '_' D I A G N O S T I C S 
	;

DB2_INTERNAL_ERROR_POINTER
	: D B '2' '_' I N T E R N A L '_' E R R O R '_' P O I N T E R 
	;

DB2_LAST_ROW
	: D B '2' '_' L A S T '_' R O W 
	;

DB2_LINE_NUMBER
	: D B '2' '_' L I N E '_' N U M B E R 
	;

DB2_MESSAGE_ID
	: D B '2' '_' M E S S A G E '_' I D 
	;

DB2_MODULE_DETECTING_ERROR
	: D B '2' '_' M O D U L E '_' D E T E C T I N G '_' E R R O R 
	;

DB2_NUMBER_PARAMETER_MARKERS
	: D B '2' '_' N U M B E R '_' P A R A M E T E R '_' M A R K E R S 
	;

DB2_NUMBER_RESULT_SETS
	: D B '2' '_' N U M B E R '_' R E S U L T '_' S E T S 
	;

DB2_NUMBER_ROWS
	: D B '2' '_' N U M B E R '_' R O W S 
	;

DB2_ORDINAL_TOKEN_
	: D B '2' '_' O R D I N A L '_' T O K E N '_' 
	;

DB2_ORDINAL_TOKEN_n
	: DB2_ORDINAL_TOKEN_ INTEGERLITERAL
	;

DB2_PRODUCT_ID
	: D B '2' '_' P R O D U C T '_' I D 
	;

DB2_REASON_CODE
	: D B '2' '_' R E A S O N '_' C O D E 
	;

DB2_RETURNED_SQLCODE
	: D B '2' '_' R E T U R N E D '_' S Q L C O D E 
	;

DB2_RETURN_STATUS
	: D B '2' '_' R E T U R N '_' S T A T U S 
	;

DB2_ROW_NUMBER
	: D B '2' '_' R O W '_' N U M B E R 
	;

DB2_SERVER_CLASS_NAME
	: D B '2' '_' S E R V E R '_' C L A S S '_' N A M E 
	;

DB2_SQL_ATTR_CURSOR_HOLD
	: D B '2' '_' S Q L '_' A T T R '_' C U R S O R '_' H O L D 
	;

DB2_SQL_ATTR_CURSOR_ROWSET
	: D B '2' '_' S Q L '_' A T T R '_' C U R S O R '_' R O W S E T 
	;

DB2_SQL_ATTR_CURSOR_SCROLLABLE
	: D B '2' '_' S Q L '_' A T T R '_' C U R S O R '_' S C R O L L A B L E 
	;

DB2_SQL_ATTR_CURSOR_SENSITIVITY
	: D B '2' '_' S Q L '_' A T T R '_' C U R S O R '_' S E N S I T I V I T Y 
	;

DB2_SQL_ATTR_CURSOR_TYPE
	: D B '2' '_' S Q L '_' A T T R '_' C U R S O R '_' T Y P E 
	;

DB2_SQLERRD1
	: D B '2' '_' S Q L E R R D '1' 
	;

DB2_SQLERRD2
	: D B '2' '_' S Q L E R R D '2' 
	;

DB2_SQLERRD3
	: D B '2' '_' S Q L E R R D '3' 
	;

DB2_SQLERRD4
	: D B '2' '_' S Q L E R R D '4' 
	;

DB2_SQLERRD5
	: D B '2' '_' S Q L E R R D '5' 
	;

DB2_SQLERRD6
	: D B '2' '_' S Q L E R R D '6' 
	;

DB2_SQLERRD_SET
	: D B '2' '_' S Q L E R R D '_' S E T 
	;

DB2_SQL_NESTING_LEVEL
	: D B '2' '_' S Q L '_' N E S T I N G '_' L E V E L 
	;

DB2_TOKEN_COUNT
	: D B '2' '_' T O K E N '_' C O U N T 
	;

DIAGNOSTICS
	: D I A G N O S T I C S 
	;

MORE_
	: M O R E 
	;

NUMBER
	: N U M B E R 
	;

RETURNED_SQLSTATE
	: R E T U R N E D '_' S Q L S T A T E 
	;

ROW_COUNT
	: R O W '_' C O U N T 
	;

SERVER_NAME
	: S E R V E R '_' N A M E 
	;

STACKED
	: S T A C K E D 
	;

CREATETAB
	: C R E A T E T A B 
	;

CREATETS
	: C R E A T E T S 
	;

DBADM
	: D B A D M 
	;

DBCTRL
	: D B C T R L 
	;

DBMAINT
	: D B M A I N T 
	;

DISPLAYDB
	: D I S P L A Y D B 
	;

IMAGCOPY
	: I M A G C O P Y 
	;

LOAD
	: L O A D 
	;

PACKADM
	: P A C K A D M 
	;

RECOVERDB
	: R E C O V E R D B 
	;

REORG
	: R E O R G 
	;

REPAIR
	: R E P A I R 
	;

STARTDB
	: S T A R T D B 
	;

STATS
	: S T A T S 
	;

STOPDB
	: S T O P D B 
	;

BIND
	: B I N D
	;

ALTERIN
	: A L T E R I N
	;

CREATEIN
	: C R E A T E I N
	;

DROPIN
	: D R O P I N
	;

USAGE
	: U S A G E
	;

ACCESSCTRL
	: A C C E S S C T R L 
	;

BINDADD
	: B I N D A D D 
	;

BINDAGENT
	: B I N D A G E N T 
	;

BSDS
	: B S D S 
	;

CREATEALIAS
	: C R E A T E A L I A S 
	;

CREATEDBA
	: C R E A T E D B A 
	;

CREATEDBC
	: C R E A T E D B C 
	;

CREATE_SECURE_OBJECT
	: C R E A T E '_' S E C U R E '_' O B J E C T 
	;

CREATESG
	: C R E A T E S G 
	;

CREATETMTAB
	: C R E A T E T M T A B 
	;

DATAACCESS
	: D A T A A C C E S S 
	;

DEBUGSESSION
	: D E B U G S E S S I O N 
	;

DISPLAY
	: D I S P L A Y 
	;

MONITOR1
	: M O N I T O R '1' 
	;

MONITOR2
	: M O N I T O R '2' 
	;

RECOVER
	: R E C O V E R 
	;

SQLADM
	: S Q L A D M 
	;

STOPALL
	: S T O P A L L 
	;

STOSPACE
	: S T O S P A C E 
	;

SYSADM
	: S Y S A D M 
	;

SYSCTRL
	: S Y S C T R L 
	;

SYSOPR
	: S Y S O P R 
	;

TRACE
	: T R A C E 
	;

UNLOAD
	: U N L O A D
	;

WRITE
	: W R I T E
	;

DEPENDENT
	: D E P E N D E N T
	;

RETAIN
	: R E T A I N
	;

CURSORS
	: C U R S O R S
	;

PASSWORD
	: P A S S W O R D
	;

HINT
	: H I N T
	;

TRANSFER
	: T R A N S F E R
	;

OWNERSHIP
	: O W N E R S H I P
	;

FOUND
	: F O U N D
	;

SQLERROR
	: S Q L E R R O R
	;

SQLWARNING
	: S Q L W A R N I N G
	;

WITHIN
	: W I T H I N
	;

EMPTY
	: E M P T Y
	;

XMLBINARY
	: X M L B I N A R Y
	;

BASE64
	: B A S E '6' '4'
	;

XMLDECLARATION
	: X M L D E C L A R A T I O N
	;

REFERENCE
	: R E F E R E N C E
	;

RETURNING
	: R E T U R N I N G
	;

//end of generated sql keywords

//generated sql scalar functions

ABS
	: A B S 
	;

ABSVAL
	: A B S V A L 
	;

ACOS
	: A C O S 
	;

ADD_DAYS
	: A D D '_' D A Y S 
	;

ADD_MONTHS
	: A D D '_' M O N T H S 
	;

AI_ANALOGY
	: A I '_' A N A L O G Y
	;

AI_SEMANTIC_CLUSTER
	: A I '_' S E M A N T I C '_' C L U S T E R
	;

AI_SIMILARITY
	: A I '_' S I M I L A R I T Y
	;

ARRAY_DELETE
	: A R R A Y '_' D E L E T E 
	;

ARRAY_FIRST
	: A R R A Y '_' F I R S T 
	;

ARRAY_LAST
	: A R R A Y '_' L A S T 
	;

ARRAY_NEXT
	: A R R A Y '_' N E X T 
	;

ARRAY_PRIOR
	: A R R A Y '_' P R I O R 
	;

ARRAY_TRIM
	: A R R A Y '_' T R I M 
	;

ASCII
	: A S C I I 
	;

ASCII_CHR
	: A S C I I '_' C H R 
	;

ASCIISTR
	: A S C I I S T R 
	;

ASCII_STR
	: A S C I I '_' S T R 
	;

ASIN
	: A S I N 
	;

ATAN
	: A T A N 
	;

ATAN2
	: A T A N '2' 
	;

ATANH
	: A T A N H 
	;

BIGINT
	: B I G I N T 
	;

BINARY
	: B I N A R Y 
	;

BITAND
	: B I T A N D 
	;

BITANDNOT
	: B I T A N D N O T 
	;

BITNOT
	: B I T N O T 
	;

BITOR
	: B I T O R 
	;

BITXOR
	: B I T X O R 
	;

BLOB
	: B L O B 
	;

BTRIM
	: B T R I M 
	;

CARDINALITY
	: C A R D I N A L I T Y 
	;

CCSID_ENCODING
	: C C S I D '_' E N C O D I N G 
	;

CEIL
	: C E I L 
	;

CEILING
	: C E I L I N G 
	;

CHAR9
	: C H A R '9' 
	;

CHARACTER_LENGTH
	: C H A R A C T E R '_' L E N G T H 
	;

CHAR_LENGTH
	: C H A R '_' L E N G T H 
	;

CHR
	: C H R 
	;

CLOB
	: C L O B 
	;

COALESCE
	: C O A L E S C E 
	;

COLLATION_KEY
	: C O L L A T I O N '_' K E Y 
	;

COMPARE_DECFLOAT
	: C O M P A R E '_' D E C F L O A T 
	;

COS
	: C O S 
	;

COSH
	: C O S H 
	;

DATE
	: D A T E 
	;

DAYOFMONTH
	: D A Y O F M O N T H 
	;

DAYOFWEEK
	: D A Y O F W E E K 
	;

DAYOFWEEK_ISO
	: D A Y O F W E E K '_' I S O 
	;

DAYOFYEAR
	: D A Y O F Y E A R 
	;

DAYS_BETWEEN
	: D A Y S '_' B E T W E E N 
	;

DBCLOB
	: D B C L O B 
	;

DEC
	: D E C 
	;

DECFLOAT
	: D E C F L O A T 
	;

DECFLOAT_FORMAT
	: D E C F L O A T '_' F O R M A T 
	;

DECFLOAT_SORTKEY
	: D E C F L O A T '_' S O R T K E Y 
	;

DECIMAL
	: D E C I M A L 
	;

DECODE
	: D E C O D E 
	;

DECRYPT_BINARY
	: D E C R Y P T '_' B I N A R Y 
	;

DECRYPT_BIT
	: D E C R Y P T '_' B I T 
	;

DECRYPT_CHAR
	: D E C R Y P T '_' C H A R 
	;

DECRYPT_DATAKEY_BIGINT
	: D E C R Y P T '_' D A T A K E Y '_' B I G I N T 
	;

DECRYPT_DATAKEY_BIT
	: D E C R Y P T '_' D A T A K E Y '_' B I T 
	;

DECRYPT_DATAKEY_CLOB
	: D E C R Y P T '_' D A T A K E Y '_' C L O B 
	;

DECRYPT_DATAKEY_DBCLOB
	: D E C R Y P T '_' D A T A K E Y '_' D B C L O B 
	;

DECRYPT_DATAKEY_DECIMAL
	: D E C R Y P T '_' D A T A K E Y '_' D E C I M A L 
	;

DECRYPT_DATAKEY_INTEGER
	: D E C R Y P T '_' D A T A K E Y '_' I N T E G E R 
	;

DECRYPT_DATAKEY_VARCHAR
	: D E C R Y P T '_' D A T A K E Y '_' V A R C H A R 
	;

DECRYPT_DATAKEY_VARGRAPHIC
	: D E C R Y P T '_' D A T A K E Y '_' V A R G R A P H I C 
	;

DECRYPT_DB
	: D E C R Y P T '_' D B 
	;

DEGREES
	: D E G R E E S 
	;

DIFFERENCE
	: D I F F E R E N C E 
	;

DIGITS
	: D I G I T S 
	;

DOUBLE_PRECISION
	: D O U B L E '_' P R E C I S I O N 
	;

DSN_XMLVALIDATE
	: D S N '_' X M L V A L I D A T E 
	;

EBCDIC_CHR
	: E B C D I C '_' C H R 
	;

EBCDIC_STR
	: E B C D I C '_' S T R 
	;

ENCRYPT_DATAKEY
	: E N C R Y P T '_' D A T A K E Y 
	;

ENCRYPT_TDES
	: E N C R Y P T '_' T D E S 
	;

EXP
	: E X P 
	;

EXTRACT
	: E X T R A C T 
	;

FLOAT
	: F L O A T 
	;

FLOOR
	: F L O O R 
	;

GENERATE_UNIQUE
	: G E N E R A T E '_' U N I Q U E 
	;

GENERATE_UNIQUE_BINARY
	: G E N E R A T E '_' U N I Q U E '_' B I N A R Y 
	;

GETHINT
	: G E T H I N T 
	;

GETVARIABLE
	: G E T V A R I A B L E 
	;

GRAPHIC
	: G R A P H I C 
	;

GREATEST
	: G R E A T E S T 
	;

HASH
	: H A S H 
	;

HASH_CRC32
	: H A S H '_' C R C '3' '2' 
	;

HASH_MD5
	: H A S H '_' M D '5' 
	;

HASH_SHA1
	: H A S H '_' S H A '1' 
	;

HASH_SHA256
	: H A S H '_' S H A '2' '5' '6' 
	;

HEX
	: H E X 
	;

IDENTITY_VAL_LOCAL
	: I D E N T I T Y '_' V A L '_' L O C A L 
	;

IFNULL
	: I F N U L L 
	;

INSTR
	: I N S T R 
	;

INT
	: I N T 
	;

INTEGER
	: I N T E G E R 
	;

JULIAN_DAY
	: J U L I A N '_' D A Y 
	;

LAST_DAY
	: L A S T '_' D A Y 
	;

LCASE
	: L C A S E 
	;

LEAST
	: L E A S T 
	;

LENGTH
	: L E N G T H 
	;

LN
	: L N 
	;

LOCATE
	: L O C A T E 
	;

LOCATE_IN_STRING
	: L O C A T E '_' I N '_' S T R I N G 
	;

LOG10
	: L O G '1' '0' 
	;

LOWER
	: L O W E R 
	;

LPAD
	: L P A D 
	;

LTRIM
	: L T R I M 
	;

MAX
	: M A X 
	;

MAX_CARDINALITY
	: M A X '_' C A R D I N A L I T Y 
	;

MIDNIGHT_SECONDS
	: M I D N I G H T '_' S E C O N D S 
	;

MIN
	: M I N 
	;

MINUTE
	: M I N U T E 
	;

MOD
	: M O D 
	;

MONTHS_BETWEEN
	: M O N T H S '_' B E T W E E N 
	;

MQREAD
	: M Q R E A D 
	;

MQREADCLOB
	: M Q R E A D C L O B 
	;

MQRECEIVE
	: M Q R E C E I V E 
	;

MQRECEIVECLOB
	: M Q R E C E I V E C L O B 
	;

MQSEND
	: M Q S E N D 
	;

MULTIPLY_ALT
	: M U L T I P L Y '_' A L T 
	;

NEXT_DAY
	: N E X T '_' D A Y 
	;

NEXT_MONTH
	: N E X T '_' M O N T H 
	;

NORMALIZE_DECFLOAT
	: N O R M A L I Z E '_' D E C F L O A T 
	;

NORMALIZE_STRING
	: N O R M A L I Z E '_' S T R I N G 
	;

NULLIF
	: N U L L I F 
	;

NVL
	: N V L 
	;

OVERLAY
	: O V E R L A Y 
	;

PACK
	: P A C K 
	;

POSITION
	: P O S I T I O N 
	;

POSSTR
	: P O S S T R 
	;

POW
	: P O W 
	;

POWER
	: P O W E R 
	;

QUANTIZE
	: Q U A N T I Z E 
	;

QUARTER
	: Q U A R T E R 
	;

RADIANS
	: R A D I A N S 
	;

RAISE_ERROR
	: R A I S E '_' E R R O R 
	;

RAND
	: R A N D 
	;

RANDOM
	: R A N D O M 
	;

REAL
	: R E A L 
	;

REGEXP_COUNT
	: R E G E X P '_' C O U N T 
	;

REGEXP_INSTR
	: R E G E X P '_' I N S T R 
	;

REGEXP_LIKE
	: R E G E X P '_' L I K E 
	;

REGEXP_REPLACE
	: R E G E X P '_' R E P L A C E 
	;

REGEXP_SUBSTR
	: R E G E X P '_' S U B S T R 
	;

REPLACE
	: R E P L A C E 
	;

RID
	: R I D 
	;

ROUND
	: R O U N D 
	;

ROUND_TIMESTAMP
	: R O U N D '_' T I M E S T A M P 
	;

ROWID
	: R O W I D 
	;

RPAD
	: R P A D 
	;

RTRIM
	: R T R I M 
	;

SCORE
	: S C O R E 
	;

SIGN
	: S I G N 
	;

SIN
	: S I N 
	;

SINH
	: S I N H 
	;

SMALLINT
	: S M A L L I N T 
	;

SOAPHTTPC
	: S O A P H T T P C 
	;

SOAPHTTPNC
	: S O A P H T T P N C 
	;

SOAPHTTPNV
	: S O A P H T T P N V 
	;

SOAPHTTPV
	: S O A P H T T P V 
	;

SOUNDEX
	: S O U N D E X 
	;

SPACE
	: S P A C E 
	;

SQRT
	: S Q R T 
	;

STRIP
	: S T R I P 
	;

STRLEFT
	: S T R L E F T 
	;

STRPOS
	: S T R P O S 
	;

STRRIGHT
	: S T R R I G H T 
	;

SUBSTR
	: S U B S T R 
	;

SUBSTRING
	: S U B S T R I N G 
	;

TAN
	: T A N 
	;

TANH
	: T A N H 
	;

TIME
	: T I M E 
	;

TIMESTAMP
	: T I M E S T A M P 
	;

TIMESTAMPADD
	: T I M E S T A M P A D D 
	;

TIMESTAMPDIFF
	: T I M E S T A M P D I F F 
	;

TIMESTAMP_FORMAT
	: T I M E S T A M P '_' F O R M A T 
	;

TIMESTAMP_ISO
	: T I M E S T A M P '_' I S O 
	;

TIMESTAMP_TZ
	: T I M E S T A M P '_' T Z 
	;

TO_CHAR
	: T O '_' C H A R 
	;

TO_CLOB
	: T O '_' C L O B 
	;

TO_DATE
	: T O '_' D A T E 
	;

TO_NUMBER
	: T O '_' N U M B E R 
	;

TOTALORDER
	: T O T A L O R D E R 
	;

TO_TIMESTAMP
	: T O '_' T I M E S T A M P 
	;

TRANSLATE
	: T R A N S L A T E 
	;

TRIM
	: T R I M 
	;

TRIM_ARRAY
	: T R I M '_' A R R A Y 
	;

TRUNC
	: T R U N C 
	;

TRUNC_TIMESTAMP
	: T R U N C '_' T I M E S T A M P 
	;

UCASE
	: U C A S E 
	;

UNICODE
	: U N I C O D E 
	;

UNICODE_STR
	: U N I C O D E '_' S T R 
	;

UNISTR
	: U N I S T R 
	;

UPPER
	: U P P E R 
	;

VARBINARY
	: V A R B I N A R Y 
	;

VARCHAR
	: V A R C H A R 
	;

VARCHAR9
	: V A R C H A R '9' 
	;

VARCHAR_BIT_FORMAT
	: V A R C H A R '_' B I T '_' F O R M A T 
	;

VARCHAR_FORMAT
	: V A R C H A R '_' F O R M A T 
	;

VARGRAPHIC
	: V A R G R A P H I C 
	;

VERIFY_GROUP_FOR_USER
	: V E R I F Y '_' G R O U P '_' F O R '_' U S E R 
	;

VERIFY_ROLE_FOR_USER
	: V E R I F Y '_' R O L E '_' F O R '_' U S E R 
	;

VERIFY_TRUSTED_CONTEXT_ROLE_FOR_USER
	: V E R I F Y '_' T R U S T E D '_' C O N T E X T '_' R O L E '_' F O R '_' U S E R 
	;

WEEK
	: W E E K 
	;

WEEK_ISO
	: W E E K '_' I S O 
	;

WRAP
	: W R A P 
	;

XMLATTRIBUTES
	: X M L A T T R I B U T E S 
	;

XMLCOMMENT
	: X M L C O M M E N T 
	;

XMLCONCAT
	: X M L C O N C A T 
	;

XMLDOCUMENT
	: X M L D O C U M E N T 
	;

XMLELEMENT
	: X M L E L E M E N T 
	;

XMLFOREST
	: X M L F O R E S T 
	;

XMLMODIFY
	: X M L M O D I F Y 
	;

XMLPARSE
	: X M L P A R S E 
	;

XMLPI
	: X M L P I 
	;

XMLQUERY
	: X M L Q U E R Y 
	;

XMLSERIALIZE
	: X M L S E R I A L I Z E 
	;

XMLTEXT
	: X M L T E X T 
	;

XMLXSROBJECTID
	: X M L X S R O B J E C T I D 
	;

XSLTRANSFORM
	: X S L T R A N S F O R M 
	;

//end of generated sql scalar functions

//generated sql special registers

CURRENT_ACCELERATOR
	: C U R R E N T [ ]+ A C C E L E R A T O R 
	;

CURRENT_APPLICATION_COMPATIBILITY
	: C U R R E N T [ ]+ A P P L I C A T I O N [ ]+ C O M P A T I B I L I T Y 
	;

CURRENT_APPLICATION_ENCODING_SCHEME
	: C U R R E N T [ ]+ (A P P L I C A T I O N [ ]+)? E N C O D I N G [ ]+ S C H E M E 
	;

CURRENT_CLIENT_ACCTNG
	: C U R R E N T [ ]+ C L I E N T '_' A C C T N G 
	;

CURRENT_CLIENT_APPLNAME
	: C U R R E N T [ ]+ C L I E N T '_' A P P L N A M E 
	;

CURRENT_CLIENT_CORR_TOKEN
	: C U R R E N T [ ]+ C L I E N T '_' C O R R '_' T O K E N 
	;

CURRENT_CLIENT_USERID
	: C U R R E N T [ ]+ C L I E N T '_' U S E R I D 
	;

CURRENT_CLIENT_WRKSTNNAME
	: C U R R E N T [ ]+ C L I E N T '_' W R K S T N N A M E 
	;

CURRENT_DATE
	: C U R R E N T ('_' | [ ]+) D A T E 
	;

CURRENT_DEBUG_MODE
	: C U R R E N T [ ]+ D E B U G [ ]+ M O D E 
	;

CURRENT_DECFLOAT_ROUNDING_MODE
	: C U R R E N T [ ]+ D E C F L O A T [ ]+ R O U N D I N G [ ]+ M O D E 
	;

CURRENT_DEGREE
	: C U R R E N T [ ]+ D E G R E E 
	;

CURRENT_EXPLAIN_MODE
	: C U R R E N T [ ]+ E X P L A I N [ ]+ M O D E 
	;

CURRENT_GET_ACCEL_ARCHIVE
	: C U R R E N T [ ]+ G E T '_' A C C E L '_' A R C H I V E 
	;

CURRENT_LOCALE_LC_CTYPE
	: C U R R E N T ('_' | [ ]+ | ([ ]+ L O C A L E [ ]+)) L C '_' C T Y P E 
	;

CURRENT_MAINTAINED_TABLE_TYPES_FOR_OPTIMIZATION
	: C U R R E N T [ ]+ M A I N T A I N E D [ ]+ (T A B L E [ ]+)? T Y P E S [ ]+ (F O R [ ]+ O P T I M I Z A T I O N)? 
	;

CURRENT_MEMBER
	: C U R R E N T [ ]+ M E M B E R 
	;

CURRENT_OPTIMIZATION_HINT
	: C U R R E N T [ ]+ O P T I M I Z A T I O N [ ]+ H I N T 
	;

CURRENT_PACKAGE_PATH
	: C U R R E N T [ ]+ P A C K A G E [ ]+ P A T H 
	;

CURRENT_PACKAGESET
	: C U R R E N T [ ]+ P A C K A G E S E T 
	;

CURRENT_PATH
	: C U R R E N T [ ]+ P A T H 
	;

CURRENT_PRECISION
	: C U R R E N T [ ]+ P R E C I S I O N 
	;

CURRENT_QUERY_ACCELERATION
	: C U R R E N T [ ]+ Q U E R Y [ ]+ A C C E L E R A T I O N 
	;

CURRENT_QUERY_ACCELERATION_WAITFORDATA
	: C U R R E N T [ ]+ Q U E R Y [ ]+ A C C E L E R A T I O N [ ]+ W A I T F O R D A T A 
	;

CURRENT_REFRESH_AGE
	: C U R R E N T [ ]+ R E F R E S H [ ]+ A G E 
	;

CURRENT_ROUTINE_VERSION
	: C U R R E N T [ ]+ R O U T I N E [ ]+ V E R S I O N 
	;

CURRENT_RULES
	: C U R R E N T [ ]+ R U L E S 
	;

CURRENT_SCHEMA
	: C U R R E N T ('_' | [ ]+) S C H E M A 
	;

CURRENT_SERVER
	: C U R R E N T [ ]+ S E R V E R 
	;

CURRENT_SQLID
	: C U R R E N T [ ]+ S Q L I D 
	;

CURRENT_TEMPORAL_BUSINESS_TIME
	: C U R R E N T [ ]+ T E M P O R A L [ ]+ B U S I N E S S '_' T I M E 
	;

CURRENT_TEMPORAL_SYSTEM_TIME
	: C U R R E N T [ ]+ T E M P O R A L [ ]+ S Y S T E M '_' T I M E 
	;

CURRENT_TIME
	: C U R R E N T ('_' | [ ]+) T I M E 
	;

CURRENT_TIMESTAMP
	: C U R R E N T ('_' | [ ]+) T I M E S T A M P 
	;

CURRENT_TIME_ZONE
	: C U R R E N T [ ]+ T I M E [ ]* Z O N E 
	;

ENCRYPTION_PASSWORD
	: E N C R Y P T I O N [ ]+ P A S S W O R D 
	;

SESSION_TIME_ZONE
	: S E S S I O N [ ]* T I M E [ ]* Z O N E 
	;

SESSION_USER
	: S E S S I O N '_' U S E R 
	;

USER
	: U S E R 
	;

//end of generated sql special registers

//sql table functions

ADMIN_TASK_LIST
	: A D M I N '_' T A S K '_' L I S T
	;

ADMIN_TASK_OUTPUT
	: A D M I N '_' T A S K '_' O U T P U T
	;

ADMIN_TASK_STATUS
	: A D M I N '_' T A S K '_' S T A T U S
	;

BLOCKING_THREADS
	: B L O C K I N G '_' T H R E A D S
	;

MQREADALL
	: M Q R E A D A L L
	;

MQREADALLCLOB
	: M Q R E A D A L L C L O B
	;

MQRECEIVEALL
	: M Q R E C E I V E A L L
	;

MQRECEIVEALLCLOB
	: M Q R E C E I V E A L L C L O B
	;

XMLTABLE
	: X M L T A B L E
	;

//end of sql table functions
/*
G_CHAR
	: G
	;

K_CHAR
	: K
	;

M_CHAR
	: M
	;
*/

SQL_STATEMENT_TERMINATOR
	: . 
	{getText().equals(statementTerminator)}?
	;

SQLIDENTIFIER
	: [a-zA-Z0-9@#$\-_]+
	;



mode ADMIN_COMMAND_DSN_MODE;

ADM_CMD_DSN_TERMINATOR
    : (
      ADM_CMD_DSN_SQL_STATEMENT_TERMINATOR 
    | ADM_CMD_DSN_SEMICOLON
    )
	-> popMode
    ;

ADM_CMD_DSN_SQL_STATEMENT_TERMINATOR
	: . 
	{getText().equals(statementTerminator)}?
	;

ADM_CMD_DSN_SEMICOLON
	: SEMICOLON
	;

ADM_CMD_DSN_INTEGER
    : [0-9][0-9]?[0-9]?[0-9]?[0-9]?[0-9]?
    ;

ADM_CMD_DSN_WS
	: WS
	->channel(HIDDEN)
	;

ADM_CMD_DSN_LPAREN
	:  LPAREN
	;

ADM_CMD_DSN_RPAREN
	:  RPAREN
	;

ADM_CMD_DSN_MINUS
	: MINUS
	;

ADM_CMD_DSN_PLUS
	: PLUS
	;

ADM_CMD_DSN_SPLAT
	: SPLAT
	;

ADM_CMD_DSN_SLASH
	: SLASH
	;

ADM_CMD_DSN_SIMPLEQUOTE
	: SIMPLEQUOTE
	;

ADM_CMD_DSN_NULL
    : NULL
    ;

ADM_CMD_DSN_CURRENT
    : CURRENT
	;

ADM_CMD_DSN_EMPTYARG
	: ADM_CMD_DSN_SIMPLEQUOTE [ ]* ADM_CMD_DSN_SIMPLEQUOTE
	;

ADM_CMD_DSN_DOT
    : DOT
    ;

ADM_CMD_DSN_COMMA
    : COMMA
    ;

SQUOTE
	: '\''
	// ->channel(HIDDEN),pushMode(QS_MODE)
	;

SQUOTE2
	: SQUOTE SQUOTE
	;

ADM_CMD_DSN_ACCELERATOR
	: ACCELERATOR
	;

ACCELERATIONWAITFORDATA
	: A C C E L E R A T I O N W A I T F O R D A T A 
	;

ACQUIRE
	: A C Q U I R E 
	;

ADM_CMD_DSN_ACTION
	: ACTION 
	;

DSN_ADMIN_COMMAND
	: C A L L ' ' S Y S P R O C '.' A D M I N '_' C O M M A N D '_' D S N
	;

APCOMPARE
	: A P C O M P A R E 
	;

APOST
	: A P O S T 
	;

APPLCOMPAT
	: A P P L C O M P A T 
	;

APRETAINDUP
	: A P R E T A I N D U P 
	;

APREUSE
	: A P R E U S E 
	;

APREUSESOURCE
	: A P R E U S E S O U R C E 
	;

ARCHIVESENSITIVE
	: A R C H I V E S E N S I T I V E 
	;

ASUSER
	: A S U S E R
	;


ADM_CMD_DSN_BIND
	: BIND
	;

// RETURNCODE
//     :(ADM_CMD_DSN_SIMPLEQUOTE? (ADM_CMD_DSN_INTEGER) ADM_CMD_DSN_SIMPLEQUOTE? | ADM_CMD_DSN_SIMPLEQUOTE ADM_CMD_DSN_SIMPLEQUOTE)
//     ;

BUSTIMESENSITIVE
	: B U S T I M E S E N S I T I V E 
	;

CACHESIZE
	: C A C H E S I Z E 
	;

CICS
	: C I C S
	;

ADM_CMD_DSN_COLLID
	: COLLID 
	;

COLSUFFIX
	: C O L S U F F I X 
	;

CONCENTRATESTMT
	: C O N C E N T R A T E S T M T 
	;

CONCURRENTACCESSRESOLUTION
	: C O N C U R R E N T A C C E S S R E S O L U T I O N 
	;

ADM_CMD_DSN_COPY
	: COPY
	;

COPYVER
	: C O P Y V E R
	;

CURRENTDATA
	: C U R R E N T D A T A 
	;

CURRENTSERVER
	: C U R R E N T S E R V E R 
	;

ADM_CMD_DSN_DATE 
	: DATE
	;

DBCSSYMBOL
	: D B C S S Y M B O L 
	;

DBCSDELIM
	: D B C S D E L I M 
	;

DBPROTOCOL
	: D B P R O T O C O L 
	;

DCLBIT
	: D C L B I T 
	;

DCLGEN
	: D C L G E N
	;

ADM_CMD_DSN_DEC
	: DEC
	;

DECDEL
	: D E C D E L 
	;

ADM_CMD_DSN_DEFER
	: DEFER
	;

DEGREE
	: D E G R E E 
	;

DEPLOY
	: D E P L O Y 
	;

DESCRIPTION
	: D E S C R I P T I O N 
	;

DESCSTAT
	: D E S C S T A T 
	;

ADM_CMD_DSN_DISABLE
	: DISABLE
	;

DISCONNECT
	: D I S C O N N E C T 
	;

DLIBATCH
	: D L I B A T C H
	;

ADM_CMD_DSN_DSN
	: DSN
	;

DSQSTMTID
	: D S Q S T M T I D 
	;

ADM_CMD_DSN_DYNAMIC
	: DYNAMIC
	;

DYNAMICRULES
	: D Y N A M I C R U L E S 
	;

ADM_CMD_DSN_ENABLE
	: ENABLE
	;

ADM_CMD_DSN_ENCODING
	: ENCODING
	;

EXPLAININPUTSCHEMA
	: E X P L A I N I N P U T S C H E M A
	;

ADM_CMD_DSN_EXPLAIN
	: EXPLAIN
	;

EXTENDEDINDICATOR
	: E X T E N D E D I N D I C A T O R 
	;

FILTER
	: F I L T E R 
	;

FLAG
	: F L A G 
	;

ADM_CMD_DSN_FREE
	: FREE
	;

ADM_CMD_DSN_GENERIC
	: GENERIC
	;

GETACCELARCHIVE
	: G E T A C C E L A R C H I V E 
	;

ADM_CMD_DSN_GROUP
	: GROUP
	;

IMMEDWRITE
	: I M M E D W R I T E 
	;

IMSBMP
	: I M S B M P
	;

IMSMPP
	: I M S M P P
	;

INDVAR
	: I N D V A R 
	;

INVALIDONLY
	: I N V A L I D O N L Y 
	;

ISOLATION
	: I S O L A T I O N 
	;

KEEPDYNAMIC
	: K E E P D Y N A M I C 
	;

ADM_CMD_DSN_LABEL
	: LABEL
	;

ADM_CMD_DSN_LANGUAGE
	: LANGUAGE
	;

LIB
	:  L I B
	;

LIBRARY
	:  L I B R A R Y
	;

LOOKUP
	: L O O K U P
	;

ADM_CMD_DSN_MEMBER
	: MEMBER
	;

ADM_CMD_DSN_NAME
	: NAME
	;

ADM_CMD_DSN_NAMES
	: NAMES
	;

NODEFER
	: N O D E F E R 
	;

NOPKLIST
	: N O P K L I S T 
	;

OPTHINT
	: O P T H I N T 
	;

ADM_CMD_DSN_OPTIONS
	: OPTIONS
	;

ADM_CMD_DSN_OWNER
	: OWNER
	;

ADM_CMD_DSN_PACKAGE
	: PACKAGE
	;

ADM_CMD_DSN_PATH
	: PATH
	;

PATHDEFAULT
	: P A T H D E F A U L T 
	;

PKLIST
	: P K L I S T 
	;

ADM_CMD_DSN_PLAN
	:  PLAN
	;

PLANMGMT
	: P L A N M G M T 
	;

PLANMGMTSCOPE
	: P L A N M G M T S C O P E 
	;

PROGAUTH
	: P R O G A U T H 
	;

ADM_CMD_DSN_QUALIFIER
	: QUALIFIER
	;

ADM_CMD_DSN_QUERY
	: QUERY
	;

QUERYACCELERATION
	: Q U E R Y A C C E L E R A T I O N 
	;

QUERYID
	: Q U E R Y I D 
	;

QUOTE
	: Q U O T E 
	;

REBIND
	: R E B I N D
	;

ADM_CMD_DSN_RELEASE
	: RELEASE
	;

REOPT
	: R E O P T 
	;

REPLVER
	: R E P L V E R
	;

RETRY
	: R E T R Y
	;


ROUNDING
	: R O U N D I N G 
	;

ADM_CMD_DSN_RUN
	:  RUN
	;

SDQSTMTID
	: S D Q S T M T I D
	;

SERVICE
	: S E R V I C E
	;

SQLDDNAME
	: S Q L D D N A M E 
	;

SQLENCODING
	: S Q L E N C O D I N G 
	;

ADM_CMD_DSN_SQLERROR
	: SQLERROR
	;

SQLRULES
	: S Q L R U L E S 
	;

ADM_CMD_DSN_STABILIZED
	: STABILIZED
	;

STBLGRP
	: S T B L G R P 
	;

STRDEL
	: S T R D E L 
	;

ADM_CMD_DSN_STRUCTURE
	: STRUCTURE
	;

SWITCH
	: S W I T C H 
	;

ADM_CMD_DSN_SYSTEM
	: SYSTEM
	;

SYSTIMESENSITIVE
	: S Y S T I M E S E N S I T I V E 
	;

ADM_CMD_DSN_TABLE
	: TABLE
	;

TEST
	: T E S T
	;

ADM_CMD_DSN_TIME
	: TIME
	;

ADM_CMD_DSN_TRIGGER
	: TRIGGER
	;

VALIDATE
	: V A L I D A T E 
	;

ADM_CMD_DSN_VERSION
	: VERSION
	;

INTENTIONALLY_IGNORED_DB2
	: ADM_CMD_DSN_MINUS [A-Z]+
	->skip,pushMode(IGNORED_MODE)
	;

INTENTIONALLY_IGNORED_DSNH
	: D S N H
	->skip,pushMode(IGNORED_MODE)
	;

INTENTIONALLY_IGNORED
	: ~[ \n\r]
	->skip
	;

mode ARG_MODE ;

ARG_LPAREN
	: LPAREN
	->type(LPAREN),pushMode(ARG_MODE)
	;

ARG_RPAREN
	: RPAREN
	->type(RPAREN),popMode
	;

ARG_NEWLINE
	: NEWLINE
	->type(NEWLINE),channel(HIDDEN)
	;

ARG_SQUOTE
	: SQUOTE
	->channel(HIDDEN),pushMode(QS_MODE)
	;

ARG
	: ~[\n\r]
	;

mode CM_MODE ;

CM_NEWLINE
	: NEWLINE
	->type(NEWLINE),channel(COMMENTS),popMode
	;

ADM_CMD_DSN_COMMENT
	: COMMENT
	->channel(COMMENTS)
	;

mode QS_MODE
	;

QS_SQUOTE2
	: SQUOTE SQUOTE
	->type(SQUOTE2)
	;

QS_SQUOTE
	: SQUOTE
	->channel(HIDDEN),popMode
	;

fragment ANYCHAR_NOSQUOTE
	: ~['\n\r']
	;

QS_NEWLINE
	: [\n\r]
	->channel(HIDDEN)
	;

QS_WS
	: WS
	->channel(HIDDEN)
	;

QUOTED_STRING_FRAGMENT
	: (ANYCHAR_NOSQUOTE)+?
	;

mode IGNORED_MODE ;

IGNORED_NEWLINE
	: NEWLINE
	->skip,popMode
	;

IGNORED_LPAREN
	: ADM_CMD_DSN_LPAREN
	->skip,pushMode(IGNORED_ARG_MODE)
	;

IGNORED_CONTINUATION
	: (ADM_CMD_DSN_MINUS | ADM_CMD_DSN_PLUS)
	->skip,pushMode(IGNORED_CONTINUATION_MODE)
	;

IGNORED_CHAR
	: ~[\n\r]
	->skip
	;

mode IGNORED_ARG_MODE ;

IGNORED_ARG_LPAREN
	: LPAREN
	->skip,pushMode(IGNORED_ARG_MODE)
	;

IGNORED_ARG_RPAREN
	: RPAREN
	->skip,popMode
	;

IGNORED_ARG_NEWLINE
	: NEWLINE
	->skip
	;

IGNORED_ARG
	: ~[\n\r]
	->skip
	;

mode IGNORED_CONTINUATION_MODE ;

IGNORED_CONTINUATION_CHAR
	: ~[\n\r]
	->skip
	;

IGNORED_CONTINUATION_NEWLINE
	: NEWLINE
	->skip,popMode
	;



/* End ADMIN_COMMAND_DSN_MODE and supporting modes */




mode ADMIN_COMMAND_DB2_MODE;

ADM_CMD_DB2_TERMINATOR
    : (
      ADM_CMD_DB2_SQL_STATEMENT_TERMINATOR 
    | ADM_CMD_DB2_SEMICOLON
    )
	-> popMode
    ;

ADM_CMD_DB2_SQL_STATEMENT_TERMINATOR
	: . 
	{getText().equals(statementTerminator)}?
	;

ADM_CMD_DB2_SEMICOLON
	: SEMICOLON
	;

ADM_CMD_DB2_DOT
    : DOT
    ;

ADM_CMD_DB2_COMMA
    : COMMA
    ;

//TODO: add al details and arguments belonging to many of below db2 commands. For now, only dis thd and term util are used by our customers...
ADM_CMD_DB2_DISPLAY
    : '-' (        D I S P L A Y | D I S P | D I S) 
        [ ]+
        (T H R E A D | T H D
        | U T I L | U T I L I T Y
        | T R A C E
        | S T A T S
        | R E S T S V C
        | R L I M I T
        | R L I M
        | P R O F I L E
        | L O G
        | P R O C E D U R E | P R O C
        | M L
        | L O C A T I O N | L O C
        | G R O U P B U F F E R P O O L | G P P O O L
        | G R O U P
        | F U N C T I O N ' ' S P E C I F I C | F U N C ' ' S P E C
        | D Y N Q U E R Y C A P T U R E | D Y N Q U E R Y
        | D D F
        | D A T A B A S E | D B
        | B U F F E R P O O L | B P O O L
        | B L O C K E R S | B L
        | A R C H I V E | A R C
        | A C C E L
        ) [ ]* ADM_CMD_DB2_LPAREN ( (ADM_CMD_DB2_SPLAT? ADM_CMD_DB2_DOT? [A-Z0-9]+?) | (ADM_CMD_DB2_DOT? ADM_CMD_DB2_SPLAT)) ADM_CMD_DB2_RPAREN
    ;

TERMINATE
    : '-' (T E R M I N A T E 
			| T E R M 
			| T E R
			// ) [ ]+ (U T I L | U T I L I T Y) [ ]* ADM_CMD_DB2_LPAREN ((ADM_CMD_DB2_SPLAT ADM_CMD_DB2_DOT [A-Z0-9]+) | (ADM_CMD_DB2_DOT? ADM_CMD_DB2_SPLAT )) ADM_CMD_DB2_RPAREN
			) [ ]+ (U T I L | U T I L I T Y
			) [ ]* ADM_CMD_DB2_LPAREN ( (ADM_CMD_DB2_SPLAT? ADM_CMD_DB2_DOT? [A-Z0-9]+?) | (ADM_CMD_DB2_DOT? ADM_CMD_DB2_SPLAT)) ADM_CMD_DB2_RPAREN
    ;

CANCEL
    : '-' (
		C A N C E L 
		| C A N
		) [ ]+ 
		(T H R E A D 
		| T H D
		) [ ]* ADM_CMD_DB2_LPAREN ( (ADM_CMD_DB2_SPLAT? ADM_CMD_DB2_DOT? [A-Z0-9]+?) | (ADM_CMD_DB2_DOT? ADM_CMD_DB2_SPLAT)) ADM_CMD_DB2_RPAREN
    ;


DB2MEMBER
    : ADM_CMD_DB2_SIMPLEQUOTE [ ]* [A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][A-Z] [ ]* ADM_CMD_DB2_SIMPLEQUOTE
    ;

// ADM_CMD_DB2_RETURNCODE
//     :(ADM_CMD_DB2_SIMPLEQUOTE? ADM_CMD_DB2_INTEGER ADM_CMD_DB2_SIMPLEQUOTE? | ADM_CMD_DB2_SIMPLEQUOTE ADM_CMD_DB2_SIMPLEQUOTE)
//     ;

ADM_CMD_DB2_INTEGER
    : [0-9][0-9]?[0-9]?[0-9]?[0-9]?[0-9]?
    ;

ADM_CMD_DB2_WS
	: WS
	->channel(HIDDEN)
	;

ADM_CMD_DB2_LPAREN
	:  LPAREN
	;

ADM_CMD_DB2_RPAREN
	:  RPAREN
	;

// ADM_CMD_DB2_MINUS
// 	:  MINUS
// 	;

// ADM_CMD_DB2_PLUS
// 	:  PLUS
// 	;

ADM_CMD_DB2_SPLAT
	: SPLAT
	;

// ADM_CMD_DB2_SLASH
// 	: SLASH
// 	;

ADM_CMD_DB2_SIMPLEQUOTE
	: SIMPLEQUOTE
	;

ADM_CMD_DB2_RESTART
    : ADM_CMD_DB2_SIMPLEQUOTE ('NO' | ADM_CMD_DB2_NULL | ADM_CMD_DB2_CURRENT | PHASE | PREVIEW) ADM_CMD_DB2_SIMPLEQUOTE
    ;

ADM_CMD_DB2_NULL
    : NULL
    ;

ADM_CMD_DB2_CURRENT
    : CURRENT
    ;

ADM_CMD_DB2_EMPTYARG
	: ADM_CMD_DB2_SIMPLEQUOTE [ ]* ADM_CMD_DB2_SIMPLEQUOTE
	;

BP
    : B P
    ;

ADM_CMD_DB2_DB
    : DB
    ;

TS
    : T S
    ;

IX
    : I X
    ;

THD
    : T H D
    ;

UT
    : U T
    ;

GRP
    : G R P
    ;

DDF
    : D D F
    ;

SYC
    : S Y C
    ;

// ADM_CMD_DB2_ANYSTRING
// 	: [A-Z0-9]+
// 	;

/* end DB2_ADMIN_COMMAND_DB2 mode */



mode DSNUTILU_MODE;

UTIL_TERMINATOR
    : (
      UTIL_SQL_STATEMENT_TERMINATOR 
    | UTIL_SEMICOLON
    )
	-> popMode
    ;

UTIL_SQL_STATEMENT_TERMINATOR
	: . 
	{getText().equals(statementTerminator)}?
	;

UTIL_SEMICOLON
	: SEMICOLON
	;

UTIL_COMMA
    : COMMA
    ;

UTIL_DOT
    : DOT
    ;

UTIL_RETURNCODE
    :(UTIL_SIMPLEQUOTE? UTIL_INTEGER UTIL_SIMPLEQUOTE? | UTIL_SIMPLEQUOTE UTIL_SIMPLEQUOTE)
    ;

UTIL_INTEGER
    : [0-9][0-9]?[0-9]?[0-9]?[0-9]?[0-9]?
    ;

UTIL_WS
	: WS
	->channel(HIDDEN)
	;

UTIL_LPAREN
	:  LPAREN
	;

UTIL_RPAREN
	:  RPAREN
	;

UTIL_MINUS
	:  MINUS
	;

UTIL_PLUS
	:  PLUS
	;

UTIL_SPLAT
	: SPLAT
	;

UTIL_SLASH
	: SLASH
	;

UTIL_SIMPLEQUOTE
	: SIMPLEQUOTE
	;

UTIL_RESTART
    : UTIL_SIMPLEQUOTE ('NO' | UTIL_NULL | UTIL_CURRENT | PHASE | PREVIEW) UTIL_SIMPLEQUOTE
    ;

UTILITYID
    : UTIL_SIMPLEQUOTE (([A-Z0-9]+ UTIL_DOT [A-Z0-9]+) | ([A-Z0-9][A-Z0-9][A-Z0-9]+))UTIL_SIMPLEQUOTE
    ;

UTIL_NULL
    : NULL
    ;

UTIL_CURRENT
    : CURRENT
    ;

PHASE
    : P H A S E
    ;

PREVIEW
    : P R E V I E W
    ;

LISTDEF
    : L I S T D E F [ ][A-Z0-9]+[ ]
    ;

TEMPLATE
    : T E M P L A T E [ ][A-Z0-9]+[ ]
    ;

UTIL_DB
    : DB
    ;

MODRCV_DELETE
    : D E L E T E [ ]+ (A G E | D A T E) UTIL_LPAREN (UTIL_SPLAT | UTIL_INTEGER) UTIL_RPAREN
    ;

DSNUM
    : (D S N U M [ ]+ A L L | D S N U M [ ]+ UTIL_INTEGER)
    ;

MODIFY
    : M O D I F Y
    ;

QUIESCE
    : Q U I E S C E
    ;

RECOVERY
    : R E C O V E R Y
    ;

SN
    : S N
    ;

PA
    : P AMPERSAND P A UTIL_LPAREN [0][2] UTIL_RPAREN
    ;

UTIL_DB2
    : DB2
    ;

IC
    : I C
    ;

UQ
    : U Q
    ;

DATASETNAME
    // TODO: this is more of a rule than a generic syntax description... maybe change? Or, when it will remain a point solution, leave it at that.
    // : [A-Z][A-Z][A-Z] UTIL_DOT AMPERSAND UTIL_DB UTIL_DOT UTIL_DOT AMPERSAND SN UTIL_DOT UTIL_DOT PA UTIL_DOT UTIL_DOT DB2 AMPERSAND IC UTIL_DOT IC UTIL_DOT AMPERSAND UQ UTIL_DOT
    : UTIL_SIMPLEQUOTE UTIL_SIMPLEQUOTE(
        [A-Z] AMPERSAND 'DB' UTIL_LPAREN UTIL_INTEGER UTIL_COMMA UTIL_INTEGER UTIL_RPAREN UTIL_DOT
        | [A-Z0-9]+
      ) 
      UTIL_DOT AMPERSAND 'DB' UTIL_DOT UTIL_DOT AMPERSAND 'SN' UTIL_DOT UTIL_DOT
      (
        [A-Z0-9]+ UTIL_DOT 'DB2'
        |  [A-Z0-9]+ UTIL_DOT 'DB2' [A-Z0-9]+ UTIL_DOT [A-Z0-9]+
        // [A-Z0-9]+ '.DB2' 
        // | 'SYSUT1.DB2' 
        // | 'SORTOUT.DB2'
        | (
            [A-Z] AMPERSAND [A-Z][A-Z] (UTIL_LPAREN UTIL_INTEGER UTIL_COMMA UTIL_INTEGER UTIL_RPAREN) UTIL_DOT UTIL_DOT 'DB2' AMPERSAND 
            // 'P' AMPERSAND 'PA(2,4)' UTIL_DOT UTIL_DOT 'DB2' AMPERSAND 
            (
                [A-Z][A-Z] (UTIL_LPAREN UTIL_INTEGER UTIL_COMMA UTIL_INTEGER UTIL_RPAREN)? UTIL_DOT
                // 'SS(4,1).'
                // | 'IC.'
            )
            ([A-Z][A-Z] UTIL_DOT)? AMPERSAND [A-Z][A-Z] UTIL_DOT
            // ([A-Z][A-Z] UTIL_DOT)? AMPERSAND 'UQ' UTIL_DOT
          )
      ) UTIL_SIMPLEQUOTE UTIL_SIMPLEQUOTE
    ;

REBUILD
    : R E B U I L D
    ;

RUNSTATS
    : R U N S T A T S
    ;
    
INVALIDATECACHE
    : I N V A L I D A T E C A C H E [ ]+ ('YES' | 'NO') [ ]*
    ;

REPORT
    : R E P O R T [ ]+ ('YES' | 'NO') [ ]*
    ;

ACCESSPATH
    : A C C E S S P A T H
    ;

// TODO: Maybe make UPDATE part of generic statistics specification, see parser "statistics" section and usage of UPDATE in several sections.
STATS_UPDATE
    : U P D A T E [ ]+ ('NONE' | ALL | UTIL_SPACE | ACCESSPATH) [ ]*
    ;

OBJECTNAME
    : [A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9] UTIL_DOT ([A-Z0-9]* UTIL_SPLAT?)
    ;

TMPL_STORCLAS
    : S T O R C L A S [ ]+ [A-Z0-9]+ [ ]*
    ;

CYL
    : C Y L
    ;

TRK
    : T R K
    ;

MB
    : M  B
    ;

TEMPLATE_SPACE
    : S P A C E [ ]* ( CYL | (UTIL_LPAREN [ ]* UTIL_INTEGER [ ]* UTIL_COMMA [ ]* UTIL_INTEGER UTIL_RPAREN [ ]+ (CYL | TRK | MB) ))
    ;

UTIL_SPACE
    : SPACE
    ;

DISP
    : D I S P [ ]* UTIL_LPAREN (UTIL_NEW | UTIL_OLD | SHR | UTIL_MOD ) [ ]* UTIL_COMMA [ ]* (DELETE_DISP | UTIL_KEEP | CATLG | UNCATLG ) [ ]* UTIL_COMMA [ ]* (DELETE_DISP | UTIL_KEEP | CATLG | UNCATLG ) [ ]* UTIL_RPAREN
    ;

DELETE_DISP
    : D E L E T E
    ;

UTIL_NEW
    : NEW
    ;

UTIL_OLD
    : OLD
    ;

SHR
    : S H R
    ;

UTIL_MOD
    : MOD
    ;

UTIL_KEEP
    : KEEP
    ;

CATLG
    : C A T L G 
    ;

UNCATLG
    : U N C A T L G 
    ;

UTIL_INCLUDE
    : INCLUDE
    ;

UTIL_TABLESPACE
    : TABLESPACE
    ;

ALL_ITEMS
    : LPAREN? [ ]* A L L [ ]* RPAREN?
    ;
    
UTIL_INDEX
    : INDEX
    ;

INDEXSPACE
    : I N D E X S P A C E
    ;

KEYCARD
    : K E Y C A R D
    ;

LOAD_DATA
    : L O A D ' ' D A T A
    ;

INCURSOR
    : I N C U R S O R UTIL_LPAREN? [ ]* [A-Z0-9]+ [ ]* UTIL_RPAREN?
    ;

RESUME
    : R E S U M E [ ]+ ('NO' | 'YES') [ ]*
    ;

UTIL_REPLACE 
    : REPLACE
    ;

NOCOPYPEND
    : N O C O P Y P E N D
    ;

NOCHECKPEND
    : N O C H E C K P E N D
    ;

ENFORCE
    : E N F O R C E [ ]+ ('NO' | CONSTRAINTS) [ ]*
    ;

CONSTRAINTS
    : C O N S T R A I N T S
    ;

WORKDDN
    : W O R K D D N UTIL_LPAREN? [ ]* [A-Z0-9]+ [ ]* UTIL_COMMA [ ]* [A-Z0-9]+ [ ]* UTIL_RPAREN?
    ;

// UTIL_END_EXEC
// 	: END_EXEC
// 	;

// UTIL_EXEC_SQL
// 	: EXEC_SQL
// 	;

EXEC
    : EXEC_SQL .*? END_EXEC
    ;
    
LOAD_INTO
    : I N T O
    ;
     
UTIL_TABLE
    : TABLE
    ;

TABLENAME
    : [A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9][A-Z0-9] UTIL_DOT [A-Z0-9_]+
    ;

FREQVAL
    : F R E Q V A L
    ;

NUMCOLS
    : N U M C O L S [ ]+ UTIL_INTEGER  [ ]*
    ;

STATS_COUNT
    : C O U N T [ ]+ UTIL_INTEGER  [ ]*
    ;

UTIL_REORG
    : REORG
    ;

STATISTICS
    : S T A T I S T I C S
    ;

SHRLEVEL
    : S H R L E V E L [ ]+ ('NONE' | SHR_REFERENCE | SHR_CHANGE) [ ]*
    ;

SHR_REFERENCE
    : R E F E R E N C E
    ;

SHR_CHANGE
    : C H A N G E
    ;

SORTKEYS
    : S O R T K E Y S
    ;

UTIL_DSN
    : DSN
    ;

UNIT
    : U N I T [ ][A-Z]+[ ]
    ;

VOLCNT
    : V O L C N T [ ]+ UTIL_INTEGER [ ]*
    ;

RETPD
    : R E T P D [ ]+ UTIL_INTEGER [ ]*
    ;

STACK
    : S T A C K [ ]('YES' | 'NO')[ ]
    ;

LIST
    : L I S T [ ][A-Z0-9]+[ ]
    ;

UTIL_LOG
    : L O G [ ]('YES' | 'NO')[ ]
    ;

NOSYSREC
    : N O S Y S R E C
    ;

COPYDDN
    : C O P Y D D N [ ]* LPAREN? [A-Z0-9]+ [ ]* RPAREN?
    ;

UNLDDN
    : U N L D D N [ ]* LPAREN? [A-Z0-9]+ [ ]* RPAREN?
    ;

UTIL_COPY
    : COPY
    ;

UTIL_PARALLEL
    : P A R A L L E L LPAREN UTIL_INTEGER RPAREN
    ;

SORTDEVT
    : S O R T D E V T [ ][A-Z0-9]+[ ]
    ;

SORTNUM
    : S O R T N U M [ ] UTIL_INTEGER
    ;

/* End DSNUTILU MODE */
