/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [stay_length]
      ,[posted_via_mobile]
      ,[room_type]
      ,[guest_category]
      ,[trip_category]
  FROM [S10523].[dbo].[HotelReviews]
where [stay_length] = 'Submitted from a mobile device' or
[room_type] = 'Submitted from a mobile device' or
[guest_category] = 'Submitted from a mobile device' or
[trip_category] = 'Submitted from a mobile device';