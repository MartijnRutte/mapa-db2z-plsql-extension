# Introduction 
This is intended to be an ANTLR4 grammar for DB2Z DSNUTILU, ADMIN_COMMAND_DSN and ADMIN_COMMAND_DB2 calls.

I am heavily indebted to Craig Schneiderwent while building this ANTLR file. I used his github mapa project to build upon.
However, all inconsistencies, flaws and irrational decisions, if any, are mine.

Based on IBM DB2Z 12 syntax.

The parser/lexer files are far from complete as compared to the endless possibilities IBM offers
They only contain the now needed syntax. In the future, we will maybe make some additions.

Martijn Rutte / opales@zonnet.nl


# Getting Started
Run make from dir db2z to build the antlr classes and test with them the antlr way.

Copy the .g4 parser and lexer file from db2z/src to any location you need to work with them, e.g. a java-antlr application that has the antlr build in it's maven build.

# Build and Test
Run make test, or run manually.

# Contribute
Any contribution is appreciated and will be reviewed.

