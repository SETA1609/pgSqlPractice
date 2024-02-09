INSERT INTO bigtext (content)
SELECT REPEAT('This is record number: ', 1) || (100000 + gs.num)::TEXT
FROM GENERATE_SERIES(0, 99999) AS gs(num);
-- gs is the call abstraction from generate series
