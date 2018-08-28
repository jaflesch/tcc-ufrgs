$(document).ready(function() {
	$('textarea').keydown(function(e) {
		var code = $(this);
		var keyCode = e.keyCode || e.which; 

		// handle TAB
		if(keyCode === 9) {
			e.preventDefault();
			var start = code.get(0).selectionStart;
		    var end = code.get(0).selectionEnd;

		    // set textarea value to: text before caret + tab + text after caret
		    code.val(code.val().substring(0, start)
		                + "\t"
		                + code.val().substring(end));

		    // put caret at right position again
		    code.get(0).selectionStart = code.get(0).selectionEnd  = start + 1;
		}
	});

	$('textarea').keyup(function(e){
		var code = $(this).val();
		var token = [];
		var word = "";
		var special_chars = [" ", "\n", ";", ",", "(", ")", ".", "\t", "-", "+", "/", "*", "'", "\"", "{", "}", ":"];
		var opened_string = false;
		

		/*
		 * ------------
		 * 	Parser
		 * ------------
		 */
		for(var i = 0; i < code.length; i ++) {
			var hold_push_for_string = false;

			// blank space
			if($.inArray(code[i], special_chars) > -1 ) {
				if(word != "" && word !== undefined) token.push(word);
				
				if(code[i] == "'") {
					// clear buffer
					word = "";

					// string begin
					token.push("'");
					
					// ' + [string] until find "'"
					var offset = 1;
					while(code[i + offset] != "'" && (i + offset < code.length)) {
						// if has '\' char, skip it and save the next's value
						if(code[i + offset] == "\\" && code[i + offset + 1] != undefined) {
							word = word + code[i + offset + 1];
							offset = offset + 2;
						}
						else {
							// avoid concat string with 'undefined'
							var substr = code[i + offset] !== undefined ? code[i + offset] : "";
							word = word + substr;
							offset++;
						}
					}
					i = i + offset;
					token.push(word);
					
					// do '[string] + "'" and save tokens
					if(code[i] == "'") {
						token.push("'");
					}
				}
				else if(code[i] == "\"") {
					// clear buffer
					word = "";

					// string begin
					token.push("\"");
					
					// ' + [string] until find "'"
					var offset = 1;
					while(code[i + offset] != "\"" && (i + offset < code.length)) {
						// if has '\' char, skip it and save the next's value
						if(code[i + offset] == "\\" && code[i + offset + 1] != undefined) {
							word = word + code[i + offset + 1];
							offset = offset + 2;
						}
						else {
							// avoid concat string with 'undefined'
							var substr = code[i + offset] !== undefined ? code[i + offset] : "";
							word = word + substr;
							offset++;
						}
					}
					i = i + offset;
					token.push(word);
					
					// do '[string] + "'" and save tokens
					if(code[i] == "\"") {
						token.push("\"");
					}
				}
				else if(code[i] == "-") {
					if(! isNaN(code[i + 1])){
						word = "-";
						console.log(code[i + 1]);
						// ' + [string] until find "'"
						var offset = 1;
						var dot_counter = 0;

						while($.inArray(code[i + offset], ["0","1","2","3","4","5","6", "7", "8", "9", "."]) > -1 && 
							(i + offset < code.length)) {
							
							if(code[i + offset] == ".") dot_counter++;
							if(dot_counter > 1) {
								token.push(word);
								token.push(".");
								word = "";
								break;
							}
							var substr = code[i + offset] !== undefined ? code[i + offset] : "";
							word = word + substr;
							offset++;
						}
						var substr = code[i + offset] !== undefined ? code[i + offset] : "";
						word = word + substr;

						i = i + offset;
						token.push(word);					
					}
					else {
						token.push(code[i]);
						word = "";	
					} 
				}
				else {
					token.push(code[i]);
				}
				
				word = "";
			}
			else {
				word = word + code[i];
			}
		}
		if(word != "" && word !== undefined) token.push(word);

		// create instance for each token
		var keywords = ["int", "select", "from", "order by", "group by", "where", "and", "or", "varchar", "text"];
		console.log(token);
		var lexeme = instantiateLexemes(token);
		
		// console.log(token, lexeme);
		// output values
		$("#output").html("");
		outputParse(lexeme);
		// console.log(token);
		
	});

	// Helpers:
	function instantiateLexemes(arrayOfTokens) {
		var lexeme = [];
		var scope_level = 0;

		for(var i = 0; i < arrayOfTokens.length; i++) {
			switch(arrayOfTokens[i].toLowerCase()) {
				// Types
				case 'int': 
					lexeme.push({
						type: 'TK_INT',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				
				// DML n DDL
				case 'select': 
					lexeme.push({
						type: 'TK_SELECT',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				case 'from': 
					lexeme.push({
						type: 'TK_FROM',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				case 'order by': 
					lexeme.push({
						type: 'TK_ORDER',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				case 'group by': 
					lexeme.push({
						type: 'TK_GROUP',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				case 'where': 
					lexeme.push({
						type: 'TK_WHERE',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				
				// Arithmetic operators
				case '+': 
					lexeme.push({
						type: 'TK_SYMBOL_PLUS',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '-': 
					lexeme.push({
						type: 'TK_SYMBOL_MINUS',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '*': 
					lexeme.push({
						type: 'TK_SYMBOL_TIMES',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '/': 
					lexeme.push({
						type: 'TK_SYMBOL_DIVIDE',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '%': 
					lexeme.push({
						type: 'TK_SYMBOL_MODULE',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;

				// logical operators
				case 'and': 
					lexeme.push({
						type: 'TK_AND',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				case 'or': 
					lexeme.push({
						type: 'TK_AND',
						level: scope_level,
						class: 'keyword',
						value: arrayOfTokens[i]
					});
					break;
				case '>':
					lexeme.push({
						type: 'TK_SYMBOL_GT',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '<':
					lexeme.push({
						type: 'TK_SYMBOL_LT',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '>=':
					lexeme.push({
						type: 'TK_SYMBOL_GET',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '<=': 
					lexeme.push({
						type: 'TK_SYMBOL_LET',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '!=': 
					lexeme.push({
						type: 'TK_SYMBOL_NEQ',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				case '=': 
					lexeme.push({
						type: 'TK_SYMBOL_EQ',
						level: scope_level,
						class: 'operator',
						value: arrayOfTokens[i]
					});
					break;
				
				// Symbols
				case '{':
					scope_level++;
					lexeme.push({
						type: '{',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				case '}':
					if(scope_level > 0) scope_level--;
					lexeme.push({
						type: '}',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				case '(':
					scope_level++;
					lexeme.push({
						type: '(',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				case ')':
					if(scope_level > 0) scope_level--;
					lexeme.push({
						type: ')',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				case ';':
					lexeme.push({
						type: ';',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				case ',':
					lexeme.push({
						type: ',',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				case ':':
					lexeme.push({
						type: ':',
						level: scope_level,
						class: 'symbol',
						value: arrayOfTokens[i]
					});
					break;
				
				// Specials
				case '\t':
					lexeme.push({
						type: 'TK_TAB',
						level: scope_level,
						class: 'symbol',
						value: "<span style='margin-left:15px'></span>"						
					});
					break;
				case '\n':
					lexeme.push({
						type: 'TK_NL',
						level: scope_level,
						class: 'symbol',
						value: "<br/>"
					});
					break;				
				case ' ':
					lexeme.push({
						type: 'TK_BLANK',
						level: scope_level,
						class: 'space',
						value: arrayOfTokens[i]
					});
					break;
				case "'": 
					lexeme.push({
						type: 'TK_START_STRING',
						level: scope_level,
						class: 'string',
						value: arrayOfTokens[i++]
					});
					if(arrayOfTokens[i] !== undefined) {
						lexeme.push({
							type: 'TK_LIT_STRING',
							level: scope_level,
							class: 'string',
							value: arrayOfTokens[i++]
						});
					}
					if(arrayOfTokens[i] !== undefined) {
						lexeme.push({
							type: 'TK_END_STRING',
							level: scope_level,
							class: 'string',
							value: arrayOfTokens[i]
						});
					}
					break;
				case "\"": 
					lexeme.push({
						type: 'TK_START_STRING_DOUBLE',
						level: scope_level,
						class: 'string',
						value: arrayOfTokens[i++]
					});
					if(arrayOfTokens[i] !== undefined) {
						lexeme.push({
							type: 'TK_LIT_STRING_DOUBLE',
							level: scope_level,
							class: 'string',
							value: arrayOfTokens[i++]
						});
					}
					if(arrayOfTokens[i] !== undefined) {
						lexeme.push({
							type: 'TK_END_STRING_DOUBLE',
							level: scope_level,
							class: 'string',
							value: arrayOfTokens[i]
						});
					}
					break;
				
				// Identifiers
				default:
					lexeme.push({
						type: 'TK_IDENTIFIER',
						level: scope_level,
						class: 'default',
						value: arrayOfTokens[i]
					});
					break;
			}
		}

		return lexeme;
	}

	function outputParse(arrayOfLexemes) {
		console.log(arrayOfLexemes);
		for (var i = 0; i < arrayOfLexemes.length; i++) {
			if(arrayOfLexemes[i].value !== undefined)
			$("#output").append("<span class='"+ arrayOfLexemes[i].class + "'>" + arrayOfLexemes[i].value + "</span>");
		}
	}
});