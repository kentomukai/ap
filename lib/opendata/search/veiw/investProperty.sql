drop view if exists investProperty;

create view investProperty as

select
    *
from
    investGeneralProperty   
union all

select
    *
from
    investSpecialProperty
;