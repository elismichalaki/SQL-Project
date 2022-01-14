
CREATE PROCEDURE  SelectPerioxi @id_περιοχή int
As
SELECT id_περιοχή,ονομασία FROM Περιοχή where ανήκει = @id_περιοχή
GO
-- ΕΝΑ ΠΑΡΑΔΕΙΓΜΑ--
exec SelectPerioxi @id_περιοχή = 14102;


