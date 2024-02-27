select TITLE, PUBLISHER, RATING from BOOKSHELF where CATEGORYNAME = 'ADULTFIC';
select TITLE, PUBLISHER, RATING from BOOKSHELF where CATEGORYNAME = 'ADULTFIC' AND RATING >=4 ;
select * FROM BOOKSHELF_AUTHOR WHERE authorname = 'E. B. WHITE' OR authorname = 'W. P. KINSELLA';
select TITLE, CHECKOUTDATE, RETURNEDDATE from BOOKSHELF_CHECKOUT where TITLE like
'%THE%';
select * from NEWSPAPER where SECTION IN ('A', 'B', 'C');
select BOOKSHELF.TITLE, AUTHORNAME, PUBLISHER, RATING
from BOOKSHELF, BOOKSHELF_AUTHOR
where BOOKSHELF.TITLE = BOOKSHELF_AUTHOR.TITLE
AND RATING >=(SELECT AVG(RATING) FROM BOOKSHELF);
select * from WORKER where AGE is NULL;
select * from WORKER order by LODGING ASC;
select BOOKSHELF.TITLE, AUTHORNAME, PUBLISHER, CATEGORYNAME, RATING
from BOOKSHELF, BOOKSHELF_AUTHOR
where BOOKSHELF.TITLE = BOOKSHELF_AUTHOR.TITLE;
select * from WORKER, WORKERSKILL
where WORKER.NAME = WORKERSKILL.NAME AND AGE >=(SELECT AVG(AGE) FROM WORKER)
ORDER BY AGE DESC;