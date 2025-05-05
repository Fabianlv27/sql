Select
    D.idMedia,
    M.title,
    D.image,
    M.sub,
    S.sName
from
    Destacados D,
    Media M,
    Subscriptions S
where
    d.idMedia = M.idMedia
    and M.idSub = S.idSub
limit
    0, 14;

Select
    M.idMedia,
    M.title,
    M.image,
    M.sub
from
    Media M
where
    M.sub = 'primevideo'
order by
    M.vistas desc
limit
    0, 20;

Select
    M.idMedia,
    M.title,
    M.image,
    M.sub
from
    Media M
where
    M.sub = 'mitele'
order by
    M.vistas desc
limit
    0, 20;

Select
    M.idMedia,
    M.title,
    M.image,
    M.sub
from
    Media M
where
    M.sub = 'mitele'
Select
    banner,
    title,
    idMedia,
    sub,
    description

Select
    idMedia,title,banner,sub,description,nameAdd,logo,genName,Lang.type,Lang.cant,Cap_Temp.idTemp,Cap_Temp.numero,Cap_Temp.link,Cap_Temp.title
from
    Media M
    join Additions_Media AM on AM.idMedia = M.idMedia
    join Additions A on A.idAdditions = AM.idAdditions
    join Gen_Media GM on GM.idMedia = M.idMedia
    join MediaDetails MD on MD.idMedia = M.idMedia
    join (
        Select
            LM.type ,count(*) as cant
        from
            Languages L,
            Lang_Media LM
        where
            LM.idMedia = "ABC123456"
        group by
            LM.type
    ) Lang
    join(
        Select idTemp,Tnumero,C.numero,link,title,description 
        from Capitulos C,Temporadas T
        where C.idTemp = T.idTemp
        and T.idMedia="ABC123456"
        order by T.numero, C.numero
    )Cap_Temp
    where
    idMedia = "ABC123456"



