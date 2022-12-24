-- Question 2
WITH base AS (
    SELECT id, 
       survey_date,
       facility,
       gps,
       type_school_gender,
--      UNNEST(type_school_class::text[]) AS type_school_class,
       unnest(string_to_array(replace(replace(replace(replace(type_school_class::text,
       '[',''),']',''),'"',''),',',''),' ')) as type_school_class,
       urban_rural_school
FROM analyst_intern.school_data
)
SELECT id, 
       survey_date,
       facility,
       gps,
       type_school_gender,
       class_type.label  AS type_school_class,
       ru.label AS urban_rural_school_label
FROM base 
LEFT JOIN analyst_intern.school_data_labels AS ru 
ON ru.code::text = base.urban_rural_school::text
AND ru.question = 'urban_rural_school'
LEFT JOIN analyst_intern.school_data_labels AS class_type 
ON class_type.code::text = base.type_school_class::text
AND class_type.question = 'type_school_class'
