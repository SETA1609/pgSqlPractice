-- Create the stored procedure
CREATE OR REPLACE FUNCTION update_keyvalue_timestamp()
  RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to execute the stored procedure on update
CREATE TRIGGER update_keyvalue_timestamp_trigger
BEFORE UPDATE ON keyvalue
FOR EACH ROW EXECUTE FUNCTION update_keyvalue_timestamp();
