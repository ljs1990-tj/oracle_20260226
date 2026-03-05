SELECT * FROM BOOK;
SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;

SELECT 
    BOOKNAME, PUBLISHER
FROM BOOK
WHERE PRICE >= 10000
UNION
SELECT 
    BOOKNAME, PUBLISHER
FROM BOOK
WHERE PUBLISHER = '굿스포츠'
ORDER BY BOOKNAME;


-- 날짜별 수익
-- 날짜와 해당 시기의 판매 가격 출력

SELECT 날짜, SUM_PRICE
FROM (
    SELECT 
        TO_CHAR(ORDERDATE, 'YYYY/MM/DD') AS 날짜, 
        SUM(SALEPRICE) AS SUM_PRICE,
        1 AS ORDERKEY
    FROM ORDERS
    GROUP BY ORDERDATE
    UNION
    SELECT 
        '매출총액', 
        SUM(SALEPRICE),
        2 AS ORDERKEY
    FROM ORDERS
    ORDER BY ORDERKEY, SUM_PRICE DESC
);

-- 책 가격이 가장 높은 상위 3개의 책이름, 가격 출력

SELECT B.*, ROWNUM
FROM BOOK B
WHERE ROWNUM <= 3
ORDER BY PRICE DESC;

SELECT B.*, ROWNUM
FROM (
    SELECT *
    FROM BOOK
    ORDER BY PRICE DESC
) B
WHERE ROWNUM <= 3;

SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%축구%';

-- CASE ~ WHEN
-- 날짜별 매출
-- 날짜, 해당 날짜의 매출, 
-- 매출이 20000 이상일 경우 '상', 10000이상일 경우 '중'
-- 그 외는 '하'로 표기 
SELECT 
    ORDERDATE,
    SUM(SALEPRICE),
    CASE 
        WHEN SUM(SALEPRICE) >= 20000 THEN '상'
        WHEN SUM(SALEPRICE) >= 10000 THEN '중'
        ELSE '하'
    END 상중하
FROM ORDERS
GROUP BY ORDERDATE;




