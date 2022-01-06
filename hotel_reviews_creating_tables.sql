/*Table for CSV data */ 

--use s10523;
--drop table dbo.HotelReviews ;

create table HotelReviews (
Hotel_Address varchar(256), 
--Additional_Number_of_Scoring int, 
Review_Date date, 
Average_Score int, 
Hotel_Name varchar(310), 
Reviewer_Nationality varchar(260), 
--Negative_Review varchar(5760), 
Review_Total_Negative_Word_Counts int, 
Total_Number_of_Reviews int, 
--Positive_Review varchar(5780), 
Review_Total_Positive_Word_Counts int, 
--Total_Number_of_Reviews_Reviewer_Has_Given int, 
Reviewer_Score int, 
Tags varchar(556), 
days_since_review int, 
--lat int, 
--lng int
);

select count(1) from HotelReviews;

/*End of CSV data table definitions */

CREATE TABLE Hotel(

   hotel_id  int identity NOT NULL PRIMARY KEY,

   hotel_name varchar(310) NOT NULL,

   hotel_address varchar(255) NOT NULL
)

GO

CREATE TABLE StayDescription(

   stay_description_id int NOT NULL PRIMARY KEY,

   length_of_stay varchar(255) NOT NULL,

   type varchar(50) NULL
   
   guest_count
   
   room_type
   
   posted_via_mobile
)
GO

CREATE TABLE CommentCharacteristic(

   comment_characteristic_id int NOT NULL PRIMARY KEY,

   total_positive_comments_word_count int NOT NULL, --max value 408, min 0

   total_negative_comments_word_count int NOT NULL -- max 408 | min 0
)
GO

CREATE TABLE TimeDimension (

   Review_Date date NOT NULL PRIMARY KEY,

   Day numeric(2) NOT NULL,

   Month numeric(2) NOT NULL,

   Quarter numeric(1) NOT NULL,

   Year numeric(4) NOT NULL,

   WeekDay numeric(1) NOT NULL,

   MonthNamePL varchar(50) NOT NULL,

   MonthNameENG varchar(50) NOT NULL,

   WeekNamePL varchar(50) NOT NULL,

   WeekNameENG varchar(50) NOT NULL

)

GO

CREATE TABLE Reviewer(

   reviewer_id int NOT NULL PRIMARY KEY,

   reviewer_nationality varchar(255) NOT NULL,

)
GO

--- tabela faktow

CREATE TABLE Hotel_Review(

   hotel_id  PK FK int NOT NULL PRIMARY KEY,
   stay_description_id PK FK ,
   reviewer_id PK FK ,
   reviewer_id PK FK , 
   comment_characteristic_id PK FK , 
   time_id PK FK , 
   negative_comments_text(negative_review), 
   positive_comments_text(positive_review), 
   numerical_score(reviewer_score), 
   upvotes_number(additional_number_of_scoring)

   

)
GO


