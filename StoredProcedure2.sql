CREATE PROCEDURE Estimation (@id int,@hmerominia1 date,@hmerominia2 date)
as
begin
set NOCOUNT ON;
DECLARE @id_�������� int 
DECLARE @id_������� int
DECLARE @��������� char(50)
DECLARE @���������� date 
DECLARE @���� int

DECLARE existingEstimations cursor for
Select e.id_�������� , a.id_�������, a.���������, e.���������� , e.���� 
from �������� as e, ������� as a
open existingEstimations 
print 'estimations made between this dates:' 
Select e.id_�������� , a.id_�������, a.���������, e.���������� , e.���� 
from �������� as e
join ������� as a on e.id_������� = a.id_������� 
where id = @id and e.���������� between @hmerominia1 and @hmerominia2
fetch next from existingEstimations  into @id_��������,@id_�������,@���������,@����������,@����
close existingEstimations ;
deallocate existingEstimations 
end

-- ��� ����������--
exec Estimation @id=2306,@hmerominia1='2020-10-25',@hmerominia2='2020-11-1'
