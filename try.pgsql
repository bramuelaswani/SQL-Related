-- SELECT *,
-- AVG(id) OVER () Rank
-- from analyst_intern.school_data
-- limit 5; 
-- SELECT id, 
--        survey_date,
--        facility,
--        gps,
--        type_school_gender
-- from analyst_intern.school_data
-- Cross join unnest(type_school_class)
select * from (
       SELECT *, 
       rank() over(PARTITION by name ) rnk 
       from common_country) s
where rnk=1