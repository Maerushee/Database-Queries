-- Using a subquery, find the names of all the tracks for the album "Californication".
select name , AlbumId
from tracks 
where AlbumId in (
  select AlbumId 
  from albums
  where title = "Californication")
