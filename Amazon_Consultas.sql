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
    -----------------------------------------
SELECT
    banner,
    description,
    IMDb,
    Annio,
    AgeRestriction
FROM
    MediaDetails MD
WHERE
    idMedia = "ABC123456";

-------------------------------
Select
    A.NameAdd,
    A.Logo
from
    Aditions_Media AM,
    Aditions A
where
    AM.idMedia = "ABC123456"
    and AM.idAddition = A.idAddition
    ----------------------------------
SELECT
    GenName
FROM
    Gen_Media GM
WHERE
    idMedia = "ABC123456";

----------------------------  
SELECT
    LM.type,
    COUNT(*) AS cant
FROM
    Languages L,
    Lang_Media LM
WHERE
    LM.idMedia = "ABC123456"
GROUP BY
    LM.type;

-----------------------------
SELECT
    T.Tnumero,
    C.numero,
    C.link,
    C.title,
    C.description
FROM
    Capitulos C,
    Temporadas T
WHERE
    C.idTemp = T.idTemp
    AND T.idMedia = "ABC123456"
ORDER BY
    T.Tnumero,
    C.numero;

 --------------------------------------

 Select idUser
 from Users_Media UM
 where UM.idMedia = "ABC123456"
 limit 0,200

 Select UM.idMedia, M.title, M.image, M.sub
 from Users_Media UM
 join Media M on UM.idMedia = M.idMedia
 where UM.idUser in (select idUser from Users_Media UM where UM.idMedia = "ABC123456" limit 0,200)
 and UM.idMedia != "ABC123456"
 GROUP BY UM.idMedia
 order by COUNT(*) desc
limit 0,20


-------------------------------

Update Profiles 
set profName='Fabian',
image='https://www.PrimeVideo.com/images/logos/Black_Noir.jpg',
where idUser='1001'  and idProfile = '1234567890';

--------------------------------

Delete from Profiles
where idUser='1001' 
and idProfile = '1234567890';

----------------------------------

Select profImage,profName
from Profiles
where idUser='1001'

-----------------------------------

select TimeInterval,
NameActor,
NameMusic,
Information
from XRay,
Actors,
Music,Media
and XRay.ContentCap = "AAB345OOJ"
and XRay.idActor = Actors.idActor
and XRay.idMusic = Music.idMusic
order by TimeInterval;





