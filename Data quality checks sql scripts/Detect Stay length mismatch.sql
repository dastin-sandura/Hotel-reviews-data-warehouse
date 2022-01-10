/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [stay_length]
      ,[posted_via_mobile]
      ,[room_type]
      ,[guest_category]
      ,[trip_category]
  FROM [S10523].[dbo].[HotelReviews]
  
where [posted_via_mobile] like 'Stayed%' or
[room_type] like 'Stayed%' or
[guest_category] like 'Stayed%' or
[trip_category] like 'Stayed%';


--'Stayed 1 night'

--select distinct room_type from Hotel_