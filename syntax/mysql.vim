" Vim syntax file
" Language:     mysql
" Maintainer:   Kenneth J. Pronovici <pronovic@ieee.org>
" Last Change:  $Date: 2007/05/05 18:25:59 $
" Filenames:    *.mysql
" URL:		ftp://cedar-solutions.com/software/mysql.vim
" Note:		The definitions below are taken from the mysql user manual as of April 2002, for version 3.23

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" General keywords which don't fall into other categories
syn keyword sqlKeyword	 action add after aggregate all alter as asc auto_increment avg avg_row_length
syn keyword sqlKeyword	 both by
syn keyword sqlKeyword	 cascade change character check checksum column columns comment constraint create cross
syn keyword sqlKeyword	 current_date current_time current_timestamp
syn keyword sqlKeyword	 data database databases day day_hour day_minute day_second
syn keyword sqlKeyword	 default delayed delay_key_write delete desc describe distinct distinctrow drop
syn keyword sqlKeyword	 enclosed escape escaped explain
syn keyword sqlKeyword	 fields file first flush for foreign from full function
syn keyword sqlKeyword	 global grant grants group
syn keyword sqlKeyword	 having heap high_priority hosts hour hour_minute hour_second
syn keyword sqlKeyword	 identified ignore index infile inner insert insert_id into isam
syn keyword sqlKeyword	 join
syn keyword sqlKeyword	 key keys kill last_insert_id leading left limit lines load local lock logs long
syn keyword sqlKeyword	 low_priority
syn keyword sqlKeyword	 match max_rows middleint min_rows minute minute_second modify month myisam
syn keyword sqlKeyword	 natural no
syn keyword sqlKeyword	 on optimize option optionally order outer outfile
syn keyword sqlKeyword	 pack_keys partial password primary privileges procedure process processlist
syn keyword sqlKeyword	 read references reload rename replace restrict returns revoke row rows
syn keyword sqlKeyword	 second select show shutdown soname sql_big_result sql_big_selects sql_big_tables sql_log_off
syn keyword sqlKeyword	 sql_log_update sql_low_priority_updates sql_select_limit sql_small_result sql_warnings starting
syn keyword sqlKeyword	 status straight_join string
syn keyword sqlKeyword	 table tables temporary terminated to trailing type
syn keyword sqlKeyword	 unique unlock unsigned update usage use using
syn keyword sqlKeyword	 values varbinary variables varying
syn keyword sqlKeyword	 where with write
syn keyword sqlKeyword	 year_month
syn keyword sqlKeyword	 zerofill

" Special values
syn keyword sqlSpecial	 false null true

" Strings (single- and double-quote)
syn region sqlString		 start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlString		 start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers and hexidecimal values
syn match sqlNumber		 "-\=\<[0-9]*\>"
syn match sqlNumber		 "-\=\<[0-9]*\.[0-9]*\>"
syn match sqlNumber		 "-\=\<[0-9]*e[+-]\=[0-9]*\>"
syn match sqlNumber		 "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match sqlNumber		 "\<0x[abcdefABCDEF0-9]*\>"

" User variables
syn match sqlVariable		 "@\a*[A-Za-z0-9]*[._]*[A-Za-z0-9]*"

" Comments (c-style, mysql-style and modified sql-style)
syn region sqlComment		 start="/\*"  end="\*/"
syn match sqlComment		 "#.*"
syn match sqlComment		 "--\_s.*"
syn sync ccomment sqlComment

" Column types
"
" This gets a bit ugly.  There are two different problems we have to
" deal with.
"
" The first problem is that some keywoards like 'float' can be used
" both with and without specifiers, i.e. 'float', 'float(1)' and
" 'float(@var)' are all valid.  We have to account for this and we
" also have to make sure that garbage like floatn or float_(1) is not
" highlighted.
"
" The second problem is that some of these keywords are included in
" function names.  For instance, year() is part of the name of the
" dayofyear() function, and the dec keyword (no parenthesis) is part of
" the name of the decode() function.

syn keyword sqlType		 tinyint smallint mediumint int integer bigint
syn keyword sqlType		 date datetime time bit bool
syn keyword sqlType		 tinytext mediumtext longtext text
syn keyword sqlType		 tinyblob mediumblob longblob blob
syn region sqlType		 start="float\W" end="."me=s-1
syn region sqlType		 start="float$" end="."me=s-1
syn region sqlType		 start="float(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="double\W" end="."me=s-1
syn region sqlType		 start="double$" end="."me=s-1
syn region sqlType		 start="double(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="double precision\W" end="."me=s-1
syn region sqlType		 start="double precision$" end="."me=s-1
syn region sqlType		 start="double precision(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="real\W" end="."me=s-1
syn region sqlType		 start="real$" end="."me=s-1
syn region sqlType		 start="real(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="numeric(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="dec\W" end="."me=s-1
syn region sqlType		 start="dec$" end="."me=s-1
syn region sqlType		 start="dec(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="decimal\W" end="."me=s-1
syn region sqlType		 start="decimal$" end="."me=s-1
syn region sqlType		 start="decimal(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="\Wtimestamp\W" end="."me=s-1
syn region sqlType		 start="\Wtimestamp$" end="."me=s-1
syn region sqlType		 start="\Wtimestamp(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="^timestamp\W" end="."me=s-1
syn region sqlType		 start="^timestamp$" end="."me=s-1
syn region sqlType		 start="^timestamp(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="\Wyear(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="^year(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="char(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="varchar(" end=")" contains=sqlNumber,sqlVariable
syn region sqlType		 start="enum(" end=")" contains=sqlString,sqlVariable
syn region sqlType		 start="\Wset(" end=")" contains=sqlString,sqlVariable
syn region sqlType		 start="^set(" end=")" contains=sqlString,sqlVariable

" Logical, string and  numeric operators
syn keyword sqlOperator	 between not and or is in like regexp rlike binary exists
syn region sqlOperator	 start="isnull(" end=")" contains=ALL
syn region sqlOperator	 start="coalesce(" end=")" contains=ALL
syn region sqlOperator	 start="interval(" end=")" contains=ALL

" Control flow functions
syn keyword sqlFlow		 case when then else end
syn region sqlFlow		 start="ifnull("   end=")"  contains=ALL
syn region sqlFlow		 start="nullif("   end=")"  contains=ALL
syn region sqlFlow		 start="if("	   end=")"  contains=ALL

" General Functions
"
" I'm leery of just defining keywords for functions, since according to the MySQL manual:
"
"     Function names do not clash with table or column names. For example, ABS is a
"     valid column name. The only restriction is that for a function call, no spaces
"     are allowed between the function name and the `(' that follows it.
"
" This means that if I want to highlight function names properly, I have to use a
" region to define them, not just a keyword.  This will probably cause the syntax file
" to load more slowly, but at least it will be 'correct'.

syn region sqlFunction	 start="abs(" end=")" contains=ALL
syn region sqlFunction	 start="acos(" end=")" contains=ALL
syn region sqlFunction	 start="adddate(" end=")" contains=ALL
syn region sqlFunction	 start="ascii(" end=")" contains=ALL
syn region sqlFunction	 start="asin(" end=")" contains=ALL
syn region sqlFunction	 start="atan(" end=")" contains=ALL
syn region sqlFunction	 start="atan2(" end=")" contains=ALL
syn region sqlFunction	 start="benchmark(" end=")" contains=ALL
syn region sqlFunction	 start="bin(" end=")" contains=ALL
syn region sqlFunction	 start="bit_and(" end=")" contains=ALL
syn region sqlFunction	 start="bit_count(" end=")" contains=ALL
syn region sqlFunction	 start="bit_or(" end=")" contains=ALL
syn region sqlFunction	 start="ceiling(" end=")" contains=ALL
syn region sqlFunction	 start="character_length(" end=")" contains=ALL
syn region sqlFunction	 start="char_length(" end=")" contains=ALL
syn region sqlFunction	 start="concat(" end=")" contains=ALL
syn region sqlFunction	 start="concat_ws(" end=")" contains=ALL
syn region sqlFunction	 start="connection_id(" end=")" contains=ALL
syn region sqlFunction	 start="conv(" end=")" contains=ALL
syn region sqlFunction	 start="cos(" end=")" contains=ALL
syn region sqlFunction	 start="cot(" end=")" contains=ALL
syn region sqlFunction	 start="count(" end=")" contains=ALL
syn region sqlFunction	 start="curdate(" end=")" contains=ALL
syn region sqlFunction	 start="curtime(" end=")" contains=ALL
syn region sqlFunction	 start="date_add(" end=")" contains=ALL
syn region sqlFunction	 start="date_format(" end=")" contains=ALL
syn region sqlFunction	 start="date_sub(" end=")" contains=ALL
syn region sqlFunction	 start="dayname(" end=")" contains=ALL
syn region sqlFunction	 start="dayofmonth(" end=")" contains=ALL
syn region sqlFunction	 start="dayofweek(" end=")" contains=ALL
syn region sqlFunction	 start="dayofyear(" end=")" contains=ALL
syn region sqlFunction	 start="decode(" end=")" contains=ALL
syn region sqlFunction	 start="degrees(" end=")" contains=ALL
syn region sqlFunction	 start="elt(" end=")" contains=ALL
syn region sqlFunction	 start="encode(" end=")" contains=ALL
syn region sqlFunction	 start="encrypt(" end=")" contains=ALL
syn region sqlFunction	 start="exp(" end=")" contains=ALL
syn region sqlFunction	 start="export_set(" end=")" contains=ALL
syn region sqlFunction	 start="extract(" end=")" contains=ALL
syn region sqlFunction	 start="field(" end=")" contains=ALL
syn region sqlFunction	 start="find_in_set(" end=")" contains=ALL
syn region sqlFunction	 start="floor(" end=")" contains=ALL
syn region sqlFunction	 start="format(" end=")" contains=ALL
syn region sqlFunction	 start="from_days(" end=")" contains=ALL
syn region sqlFunction	 start="from_unixtime(" end=")" contains=ALL
syn region sqlFunction	 start="get_lock(" end=")" contains=ALL
syn region sqlFunction	 start="greatest(" end=")" contains=ALL
syn region sqlFunction	 start="group_unique_users(" end=")" contains=ALL
syn region sqlFunction	 start="hex(" end=")" contains=ALL
syn region sqlFunction	 start="inet_aton(" end=")" contains=ALL
syn region sqlFunction	 start="inet_ntoa(" end=")" contains=ALL
syn region sqlFunction	 start="instr(" end=")" contains=ALL
syn region sqlFunction	 start="lcase(" end=")" contains=ALL
syn region sqlFunction	 start="least(" end=")" contains=ALL
syn region sqlFunction	 start="length(" end=")" contains=ALL
syn region sqlFunction	 start="load_file(" end=")" contains=ALL
syn region sqlFunction	 start="locate(" end=")" contains=ALL
syn region sqlFunction	 start="log(" end=")" contains=ALL
syn region sqlFunction	 start="log10(" end=")" contains=ALL
syn region sqlFunction	 start="lower(" end=")" contains=ALL
syn region sqlFunction	 start="lpad(" end=")" contains=ALL
syn region sqlFunction	 start="ltrim(" end=")" contains=ALL
syn region sqlFunction	 start="make_set(" end=")" contains=ALL
syn region sqlFunction	 start="master_pos_wait(" end=")" contains=ALL
syn region sqlFunction	 start="max(" end=")" contains=ALL
syn region sqlFunction	 start="md5(" end=")" contains=ALL
syn region sqlFunction	 start="mid(" end=")" contains=ALL
syn region sqlFunction	 start="min(" end=")" contains=ALL
syn region sqlFunction	 start="mod(" end=")" contains=ALL
syn region sqlFunction	 start="monthname(" end=")" contains=ALL
syn region sqlFunction	 start="now(" end=")" contains=ALL
syn region sqlFunction	 start="oct(" end=")" contains=ALL
syn region sqlFunction	 start="octet_length(" end=")" contains=ALL
syn region sqlFunction	 start="ord(" end=")" contains=ALL
syn region sqlFunction	 start="period_add(" end=")" contains=ALL
syn region sqlFunction	 start="period_diff(" end=")" contains=ALL
syn region sqlFunction	 start="pi(" end=")" contains=ALL
syn region sqlFunction	 start="position(" end=")" contains=ALL
syn region sqlFunction	 start="pow(" end=")" contains=ALL
syn region sqlFunction	 start="power(" end=")" contains=ALL
syn region sqlFunction	 start="quarter(" end=")" contains=ALL
syn region sqlFunction	 start="radians(" end=")" contains=ALL
syn region sqlFunction	 start="rand(" end=")" contains=ALL
syn region sqlFunction	 start="release_lock(" end=")" contains=ALL
syn region sqlFunction	 start="repeat(" end=")" contains=ALL
syn region sqlFunction	 start="reverse(" end=")" contains=ALL
syn region sqlFunction	 start="round(" end=")" contains=ALL
syn region sqlFunction	 start="rpad(" end=")" contains=ALL
syn region sqlFunction	 start="rtrim(" end=")" contains=ALL
syn region sqlFunction	 start="sec_to_time(" end=")" contains=ALL
syn region sqlFunction	 start="session_user(" end=")" contains=ALL
syn region sqlFunction	 start="sign(" end=")" contains=ALL
syn region sqlFunction	 start="sin(" end=")" contains=ALL
syn region sqlFunction	 start="soundex(" end=")" contains=ALL
syn region sqlFunction	 start="space(" end=")" contains=ALL
syn region sqlFunction	 start="sqrt(" end=")" contains=ALL
syn region sqlFunction	 start="std(" end=")" contains=ALL
syn region sqlFunction	 start="stddev(" end=")" contains=ALL
syn region sqlFunction	 start="strcmp(" end=")" contains=ALL
syn region sqlFunction	 start="subdate(" end=")" contains=ALL
syn region sqlFunction	 start="substring(" end=")" contains=ALL
syn region sqlFunction	 start="substring_index(" end=")" contains=ALL
syn region sqlFunction	 start="subtime(" end=")" contains=ALL
syn region sqlFunction	 start="sum(" end=")" contains=ALL
syn region sqlFunction	 start="sysdate(" end=")" contains=ALL
syn region sqlFunction	 start="system_user(" end=")" contains=ALL
syn region sqlFunction	 start="tan(" end=")" contains=ALL
syn region sqlFunction	 start="time_format(" end=")" contains=ALL
syn region sqlFunction	 start="time_to_sec(" end=")" contains=ALL
syn region sqlFunction	 start="to_days(" end=")" contains=ALL
syn region sqlFunction	 start="trim(" end=")" contains=ALL
syn region sqlFunction	 start="ucase(" end=")" contains=ALL
syn region sqlFunction	 start="unique_users(" end=")" contains=ALL
syn region sqlFunction	 start="unix_timestamp(" end=")" contains=ALL
syn region sqlFunction	 start="upper(" end=")" contains=ALL
syn region sqlFunction	 start="user(" end=")" contains=ALL
syn region sqlFunction	 start="version(" end=")" contains=ALL
syn region sqlFunction	 start="week(" end=")" contains=ALL
syn region sqlFunction	 start="weekday(" end=")" contains=ALL
syn region sqlFunction	 start="yearweek(" end=")" contains=ALL

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mysql_syn_inits")
  if version < 508
    let did_mysql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sqlKeyword		 Statement
  HiLink sqlSpecial		 Special
  HiLink sqlString		 String
  HiLink sqlNumber		 Number
  HiLink sqlVariable	 Identifier
  HiLink sqlComment		 Comment
  HiLink sqlType		 Type
  HiLink sqlOperator	 Statement
  HiLink sqlFlow		 Statement
  HiLink sqlFunction	 Function

  delcommand HiLink
endif

let b:current_syntax = "mysql"

