Select  d.idMedia,d.title,d.image,M.sub
from TDestacados d,
TMedia M
limit 0,14;

Select M.idMedia,M.title,M.image,M.sub
from Media M
order by M.vistas desc
limit 0,20;

Select M.idMedia,M.title,M.image,M.sub
from Media M
where M.sub='mitele'
order by M.vistas desc
limit 0,20;

