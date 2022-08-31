CREATE OR REPLACE FUNCTION trgValidaDadosConsulta() RETURNS trigger as $trgValidaDados

DECLARE
pac_row record;
espec_row record;

BEGIN
	RAISE NOTICE 'Nossa trigger rodou!!!';
	RETURN NEW;
END;
$trgValidaDadosConsulta$ LANGUAGE plpgsql;

CREATE TRIGGER ValidaDadosConsulta
BEFORE INSERT OR UPDATE ON consultas
FOR REACH ROW
EXECUTE PROCEDURE trgValidaDadosConsulta();