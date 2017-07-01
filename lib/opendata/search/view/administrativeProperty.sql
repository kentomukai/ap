drop view if exists administrativeProperty;

create view administrativeProperty as

select
     *
from
    keizaisangyosyoProperty    
union all

select
     *
from
    boueisyoProperty
union all

select
     *
from
    kokudokotusyoProperty
union all

select
     *
from
    koseirodosyoProperty
union all

select
     *
from
    saikousaiProperty
union all

select
     *
from
    gaimusyoProperty
union all

select
     *
from
    kunaityoProperty
union all

select
     *
from
    sangiinProperty    
union all

select
     *
from
    houmusyoProperty
union all

select
     *
from
    soumusyoProperty    
union all

select
     *
from
    monbukagakusyoProperty    
union all

select
     *
from
    naikakuProperty
union all

select
     *
from
    syugiinProperty
union all

select
     *
from
    jinjiinProperty    
union all

select
     *
from
    naikakuhuProperty
union all

select
     *
from
    kaikeikensainProperty
union all

select
     *
from
    nosuisyoProperty
union all

select
     *
from
    zaimusyoProperty
union all

select
     *
from
    kankyosyoProperty
union all

select
     *
from
    keisatutyoProperty
;