-- 인원수에 따른 객실 조회
SELECT ROOM_TYPE, ROOM_RATES, ROOM_THUMBNAIL
FROM ROOM_TB
WHERE MAX_NUM >= 4;

-- 


UPDATE ROOM_TB
SET ROOM_THUMBNAIL = '/resources/images/room/Single/single0.jpg'
WHERE ROOM_TYPE = 'SINGLE';

SELECT * FROM ROOM_TB;