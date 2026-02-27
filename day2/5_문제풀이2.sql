SELECT
    EMAIL,
    RPAD('*', INSTR(EMAIL, '@')-1, '*')
    || '@' ||
    RPAD('*', INSTR(EMAIL, '.') - INSTR(EMAIL, '@') -1, '*')
    || SUBSTR(EMAIL, INSTR(EMAIL, '.')) AS 메일
FROM PROFESSOR;

SELECT 
    EMAIL,
    INSTR(EMAIL, '.'),
    INSTR(EMAIL, '@')
FROM PROFESSOR;
