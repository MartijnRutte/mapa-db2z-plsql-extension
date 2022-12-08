JC = javac
CP = "./class:./lib/commons-cli-1.4.jar:./lib/antlr-4.9.2-complete.jar"
JCOPT = -d ./class -g -Xlint -cp $(CP)
#JCOPT = -d ./class -g -cp $(CP)
JCOPT1 = -d ./class -cp $(CP)
AOPT = -visitor -listener
#AOPT = -o ./src -lib ./src -visitor -listener

./class/%.class: ./src/%.java
	echo `date` $< >>build.log
	$(JC) $(JCOPT) $<

./src/%.tokens: ./src/%.g4
	echo `date` $< >>build.log
	java -jar ./lib/antlr-4.9.2-complete.jar $(AOPT) $<
	$(JC) $(JCOPT1) ./src/$**.java
	

all: ./src/DB2zPLSQLLexer.tokens ./src/DB2zPLSQLParser.tokens

prepare:
	@mkdir -p class

clean:
	@rm -f src/*.tokens

testrig:
	echo `date` $@ $(n) >> build.log
	java -cp ./class:.:./antlr-4.9.2-complete.jar org.antlr.v4.gui.TestRig DB2zPLSQL startRule -gui -tokens < ./testdata/plsql_$(n)

test:
ifeq ($(strip $(n)),)
	echo `date` $@ >> build.log
	echo `date`
	./src/tester all
	echo `date`
else
	echo `date` $@ $(n) >> build.log
	./src/tester $(n)
endif

jar:
	echo `date` $@ >> build.log
	jar cf DB2zPLSQL.jar -C class DB2zPLSQL*


./src/DB2zPLSQLLexer.tokens:

./src/DB2zPLSQLParser.tokens: ./src/DB2zPLSQLLexer.tokens

