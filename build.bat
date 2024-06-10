@echo off
rem 編譯 Bison 文件
bison -d yacc.y
if %errorlevel% neq 0 goto :bison_error

rem 編譯 Flex 文件
flex lex.l
if %errorlevel% neq 0 goto :flex_error

rem 編譯 Bison 生成的 C 文件
gcc -c yacc.tab.c
if %errorlevel% neq 0 goto :parser_gcc_error

rem 編譯 Flex 生成的 C 文件
gcc -c lex.yy.c
if %errorlevel% neq 0 goto :lex_gcc_error

rem 編譯主程序文件
gcc -c main.c
if %errorlevel% neq 0 goto :main_gcc_error

rem 連結所有編譯過的文件
gcc main.o lex.yy.o yacc.tab.o -o main
if %errorlevel% neq 0 goto :final_gcc_error

echo Build succeeded.
goto :end

:bison_error
echo Bison compilation failed.
goto :end

:flex_error
echo Flex compilation failed.
goto :end


:parser_gcc_error
echo Parser compilation failed.
goto :end

:lex_gcc_error
echo Lex compilation failed.
goto :end

:main_gcc_error
echo Main compilation failed.
goto :end

:final_gcc_error
echo Final compilation failed.
goto :end

:end
