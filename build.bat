@echo off
rem �sĶ Bison ���
bison -d yacc.y
if %errorlevel% neq 0 goto :bison_error

rem �sĶ Flex ���
flex lex.l
if %errorlevel% neq 0 goto :flex_error

rem �sĶ Bison �ͦ��� C ���
gcc -c yacc.tab.c
if %errorlevel% neq 0 goto :parser_gcc_error

rem �sĶ Flex �ͦ��� C ���
gcc -c lex.yy.c
if %errorlevel% neq 0 goto :lex_gcc_error

rem �sĶ�D�{�Ǥ��
gcc -c main.c
if %errorlevel% neq 0 goto :main_gcc_error

rem �s���Ҧ��sĶ�L�����
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
