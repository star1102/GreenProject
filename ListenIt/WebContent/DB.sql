create table mp3	
(
	  id			number				primary key
	, genre			varchar2(20)
	, song_name		varchar2(30)		not null
	, singer_name	varchar2(30)		not null
	, file_name		varchar2(300)		not null
	, upload_name	varchar2(30)		not null
	, album_name	varchar2(20)
	, track_no		varchar2(3)
	, album_img		varchar2(13)		default 'y'
	, upload_date	date				default sysdate
);

DROP TABLE mp3;
SELECT * FROM mp3;
DELETE FROM mp3;

create sequence mp3_id increment by 1;