// Grammar for versions:    3.0    3.1    3.2  3.3.0              
// Generated by CompareGrammar on 2018-01-16 at 20:21:38.826+00:00


// Top non-terminals: arglist augassign compound_stmt dictorsetmaker power term


%%

%public
augassign:
	  PLUSEQUAL
	| MINEQUAL
	| STAREQUAL
	| SLASHEQUAL
	| PERCENTEQUAL
	| AMPEREQUAL
	| VBAREQUAL
	| CIRCUMFLEXEQUAL
	| LEFTSHIFTEQUAL
	| RIGHTSHIFTEQUAL
	| DOUBLESTAREQUAL
	| DOUBLESLASHEQUAL
	{} ;

%public
argument: // Used in: arglist
	  test _optional(comp_for {})
	| test EQUAL test
	{} ;

%public
decorated: // Used in: compound_stmt
	  decorators _choice(classdef | funcdef {})
	{} ;

%public
term:
	  factor _star(_choice(STAR | SLASH | PERCENT | DOUBLESLASH {}) factor {})
	{} ;

%public
dictorsetmaker:
	  test COLON test _choice(comp_for | _star(COMMA test COLON test {}) _optional(COMMA {}) {})
	| test _choice(comp_for | _star(COMMA test {}) _optional(COMMA {}) {})
	{} ;

%public
power:
	  atom _star(trailer {}) _optional(DOUBLESTAR factor {})
	{} ;

%public
compound_stmt:
	  if_stmt
	| while_stmt
	| for_stmt
	| try_stmt
	| with_stmt
	| funcdef
	| classdef
	| decorated
	{} ;

%public
arglist:
	  _star(argument COMMA {}) _choice(argument _optional(COMMA {}) | STAR test _star(COMMA argument {}) _optional(COMMA DOUBLESTAR test {}) | DOUBLESTAR test {})
	{} ;


%%


