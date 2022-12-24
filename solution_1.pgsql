-- Question 1
/*
Code Asumption:
- Cleaning 
- Removing nulls
*/

-- SELECT reg.unique_id,
--        array_agg(vac.bcg) AS bcg_dates,
--        array_remove(array_agg(CASE WHEN vac.hepb ='' THEN NULL ELSE hepb END), NULL) AS hepb_dates,
--        max(hepb)::date as hept_b_v,
--        array_remove(array_agg(CASE WHEN vac.mr_1 ='' THEN NULL ELSE mr_1 END), NULL) AS mr_1_dates,
--        array_remove(array_agg(CASE WHEN vac.opv_0 ='' THEN NULL ELSE opv_0 END), NULL) AS opv_o_dates,
--        array_remove(array_agg(CASE WHEN vac.opv_1 ='' THEN NULL ELSE opv_1 END), NULL) AS opv_1_dates,
--        array_remove(array_agg(CASE WHEN vac.opv_2 ='' THEN NULL ELSE opv_2 END), NULL) AS opv_2_dates,
--        array_remove(array_agg(CASE WHEN vac.opv_3 ='' THEN NULL ELSE opv_3 END), NULL) AS opv_3_dates,
--        array_remove(array_agg(CASE WHEN vac.pcv_1 ='' THEN NULL ELSE pcv_1 END), NULL) AS pcv_1_dates,
--        array_remove(array_agg(CASE WHEN vac.pcv_2 ='' THEN NULL ELSE pcv_2 END), NULL) AS pcv_2_dates,
--        array_remove(array_agg(CASE WHEN vac.pcv_3 ='' THEN NULL ELSE pcv_3 END), NULL) AS pcv_3_dates,
--        array_remove(array_agg(CASE WHEN vac.penta_1 ='' THEN NULL ELSE penta_1 END), NULL) AS penta_1_dates,
--        array_remove(array_agg(CASE WHEN vac.penta_2 ='' THEN NULL ELSE penta_2 END), NULL) AS penta_2_dates,
--        array_remove(array_agg(CASE WHEN vac.penta_3 ='' THEN NULL ELSE penta_3 END), NULL) AS penta_3_dates,
--        array_remove(array_agg(CASE WHEN vac.rota_1 ='' THEN NULL ELSE rota_1 END), NULL) AS rota_1_dates,
--        array_remove(array_agg(CASE WHEN vac.rota_2 ='' THEN NULL ELSE rota_2 END), NULL) AS rota_2_dates,
--        array_remove(array_agg(CASE WHEN vac.yellow_fever ='' THEN NULL ELSE yellow_fever END), NULL) AS yellow_fever_dates
-- FROM analyst_intern.child_registrations AS reg 
-- LEFT JOIN analyst_intern.child_vaccinations AS vac 
-- ON vac.unique_id = reg.unique_id
--GROUP BY 1;


/*
*/
select 
c.unique_id ,
c.birthdate::date,
c.gender,
max(bcg) as bcg,
max(hepb) as hepb,
max(mr_1) as mr_1,
max(opv_0) as opv_0,
max(opv_1) as opv_1,
max(opv_2) as opv_2,
max(opv_3) as opv_3,
max(pcv_1) as pcv_1,
max(pcv_2) as pcv_2,
max(pcv_3) as pcv_3,
max(penta_1) as penta_1,
max(penta_2) as penta_2,
max(penta_3) as penta_3,
max(rota_1) as rota_1 ,
max(rota_2) as rota_2,
max(yellow_fever) as yellow_fever 
from analyst_intern.child_registrations c
left join analyst_intern.child_vaccinations v on c.unique_id=v.unique_id 
group by 1,2,3