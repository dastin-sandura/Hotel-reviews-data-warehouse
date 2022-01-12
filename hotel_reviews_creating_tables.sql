/*Table for CSV data */ 

--use s10523;
drop table dbo.HotelReviews ;

create table  HotelReviews (
Hotel_Address varchar(256), 
Additional_Number_of_Scoring int, 
Review_Date date, 
Average_Score int, 
Hotel_Name varchar(310), 
Reviewer_Nationality varchar(260), 
--Negative_Review varchar(5760), 
Review_Total_Negative_Word_Counts int, 
Total_Number_of_Reviews int, 
--Positive_Review varchar(5780), 
Review_Total_Positive_Word_Counts int, 
Total_Number_of_Reviews_Reviewer_Has_Given int, 
Reviewer_Score int, 
Tags varchar(556), 
days_since_review int, 
row_count int default 1
--lat int, 
--lng int
);

/*End of CSV data table definitions */

CREATE TABLE Hotel(

   hotel_id  int identity PRIMARY KEY,

   hotel_name varchar(310) NOT NULL,

   hotel_address varchar(255) NOT NULL
)

GO

CREATE TABLE StayDescription(

   stay_description_id int identity PRIMARY KEY,

   stay_length varchar(255),

   trip_category varchar(255),
   
   guest_category varchar(255),
   
   room_type varchar(255),
   
   posted_via_mobile varchar(255)
)
GO

CREATE TABLE CommentCharacteristic(

   comment_characteristic_id int identity PRIMARY KEY,

   total_positive_comments_word_count int, --max value 408, min 0

   total_negative_comments_word_count int -- max 408 | min 0
)
GO

CREATE TABLE TimeDimension (

	time_id int identity PRIMARY KEY,

   Review_Date date NOT NULL,

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

   reviewer_id int identity PRIMARY KEY,

   reviewer_nationality varchar(255),

)
GO

--- tabela faktow

CREATE TABLE Hotel_Review(
   hotel_id int NOT NULL,
   stay_description_id int NOT NULL,
   reviewer_id int NOT NULL,
   comment_characteristic_id int NOT NULL, 
   time_id int NOT NULL, 
   numerical_score numeric NOT NULL,
   upvotes_number numeric NOT NULL,
   row_count numeric NULL
   PRIMARY KEY(hotel_id, stay_description_id, reviewer_id, comment_characteristic_id,time_id)
)
GO

-- adding constraints 

ALTER TABLE Hotel_Review
ADD CONSTRAINT fk_hotel
FOREIGN KEY(hotel_id) REFERENCES Hotel
GO

ALTER TABLE Hotel_Review
ADD CONSTRAINT fk_stay_description
FOREIGN KEY(stay_description_id) REFERENCES StayDescription
GO

ALTER TABLE Hotel_Review
ADD CONSTRAINT fk_reviewer
FOREIGN KEY(reviewer_id) REFERENCES Reviewer
GO

ALTER TABLE Hotel_Review
ADD CONSTRAINT fk_comment_characteristic
FOREIGN KEY(comment_characteristic_id) REFERENCES CommentCharacteristic
GO

ALTER TABLE Hotel_Review
ADD CONSTRAINT fk_time
FOREIGN KEY(time_id) REFERENCES TimeDimension
GO



SELECT Hotel_Address
      ,Review_Date
      ,Average_Score
      ,Hotel_Name
      ,Reviewer_Nationality
      ,Review_Total_Negative_Word_Counts
      ,Total_Number_of_Reviews
      ,Review_Total_Positive_Word_Counts
      ,Reviewer_Score
      ,Tags
      ,days_since_review
  FROM HotelReviews

  group by Hotel_Address
      ,Review_Date
      ,Average_Score
      ,Hotel_Name
      ,Reviewer_Nationality
      ,Review_Total_Negative_Word_Counts
      ,Total_Number_of_Reviews
      ,Review_Total_Positive_Word_Counts
      ,Reviewer_Score
      ,Tags
      ,days_since_review;

	  alter table HotelReviews add   row_count int default 1;
	  alter table HotelReviews drop column ro;

	  /*
Data of a duplicated row 
	--Hotel_Address														Additional_Number_of_Scoring	Review_Date	Average_Score	Hotel_Name			Reviewer_Nationality	Review_Total_Negative_Word_Counts	Total_Number_of_Reviews	Review_Total_Positive_Word_Counts	Total_Number_of_Reviews_Reviewer_Has_Given	Reviewer_Score	Tags	days_since_review	row_count
	--40 Rue du Commandant Ren Mouchotte 14th arr 75014 Paris France	228								2015-09-12	8	H tel Concorde Montparnasse		Egypt 					2	2515	2	2	2	[' Couple ', ' Classic Double Room ', ' Stayed 3 nights ', ' Submitted from a mobile device ']	691	1

	select * from HotelReviews where
	Additional_Number_of_Scoring = 228
	and Average_Score = 8
	and Hotel_Name = 'H tel Concorde Montparnasse'
	and Reviewer_Nationality = ' Egypt '
	and Review_Total_Negative_Word_Counts = 2
	;
	  */