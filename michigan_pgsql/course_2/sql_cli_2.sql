BEGIN;
ALTER TABLE pg4e_debug
ADD COLUMN neon759 INTEGER;
COMMIT;

SELECT neon759 FROM pg4e_debug LIMIT 1;
