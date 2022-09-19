do $$
DECLARE x VARCHAR(20) :='Nick';
BEGIN
Raise Notice 'Test the name %',x;
END$$