-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION StudentAvg 
(
	-- Add the parameters for the function here
	@Studentid as int,
	@Classid as int
)
RETURNS Decimal(18,2)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @avgMarks as decimal(18,2)

	-- Add the T-SQL statements to compute the return value here
	set @avgMarks= (
select s.StudentName,c.ClassID,(sum(m.marks)/count(m.SubjectID))Total from Marks m
left join mStudent s on s.StudentID=m.StudentId
left join mClass c on c.ClassID=m.ClassID
where s.StudentId=@Studentid and
c.ClassID=@Classid
group by s.StudentName,c.ClassID
	)

	-- Return the result of the function
	RETURN @avgMarks

END
GO

