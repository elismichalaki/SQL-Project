
CREATE PROCEDURE  SelectPerioxi @id_������� int
As
SELECT id_�������,�������� FROM ������� where ������ = @id_�������
GO
-- ��� ����������--
exec SelectPerioxi @id_������� = 14102;


