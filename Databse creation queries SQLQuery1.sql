use s10523;
--drop table dbo.HotelReviews ;

create table HotelReviews (
Hotel_Address varchar(100), 
--Additional_Number_of_Scoring int, 
Review_Date date, 
--Average_Score int, 
Hotel_Name varchar(310), 
Reviewer_Nationality varchar(260), 
--Negative_Review varchar(5760), 
Review_Total_Negative_Word_Counts int, 
Total_Number_of_Reviews int, 
--Positive_Review varchar(5780), 
Review_Total_Positive_Word_Counts int, 
--Total_Number_of_Reviews_Reviewer_Has_Given int, 
Reviewer_Score int, 
Tags varchar(300), 
--days_since_review int, 
--lat int, 
--lng int
);

select count(1) from HotelReviews;

select avg(hr.Reviewer_Score) from HotelReviews hr;