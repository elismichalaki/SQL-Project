CREATE PROCEDURE Estimation (@id int,@hmerominia1 date,@hmerominia2 date)
as
begin
set NOCOUNT ON;
DECLARE @id_εκτίμηση int 
DECLARE @id_ακίνητο int
DECLARE @διεύθυνση char(50)
DECLARE @ημερομηνία date 
DECLARE @τιμή int

DECLARE existingEstimations cursor for
Select e.id_εκτίμηση , a.id_ακίνητο, a.διεύθυνση, e.ημερομηνία , e.τιμή 
from Εκτίμηση as e, Ακίνητο as a
open existingEstimations 
print 'estimations made between this dates:' 
Select e.id_εκτίμηση , a.id_ακίνητο, a.διεύθυνση, e.ημερομηνία , e.τιμή 
from Εκτίμηση as e
join Ακίνητο as a on e.id_ακίνητο = a.id_ακίνητο 
where id = @id and e.ημερομηνία between @hmerominia1 and @hmerominia2
fetch next from existingEstimations  into @id_εκτίμηση,@id_ακίνητο,@διεύθυνση,@ημερομηνία,@τιμή
close existingEstimations ;
deallocate existingEstimations 
end

-- ΕΝΑ ΠΑΡΑΔΕΙΓΜΑ--
exec Estimation @id=2306,@hmerominia1='2020-10-25',@hmerominia2='2020-11-1'
