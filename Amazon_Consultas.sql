Select  D.idMedia,M.title,D.image,M.sub,S.sName
from Destacados D,
Media M,
Subscriptions S
where d.idMedia=M.idMedia
and M.idSub=S.idSub
limit 0,14;

