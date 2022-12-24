select reg.unique_id,
array_remove(array_agg(CASE WHEN vac.bcg='' THEN NULL ELSE bcg end),null) as bcg_dates,
array_remove(array_agg(CASE WHEN vac.opv_0='' THEN NULL ELSE opv_1 END),NULL) as opv_0_dates,
array_remove(array_agg(CASE WHEN vac.mr_1='' THEN NULL ELSE mr_1 END),NULL) as mr_1_dates,
array_remove(array_agg(CASE WHEN vac.pcv_2='' THEN NULL ELSE pcv_2 END),NULL) as pcv_2_dates,
array_remove(array_agg(CASE WHEN vac.rota_1='' THEN NULl ELSE rota_1 end),null) as rota_dates,
array_remove(array_agg(case when vac.penta_2='' then null else penta_2 end),null) as penta_2_dates
from analyst_intern.child_registrations as reg
left join analyst_intern.child_vaccinations as vac
on reg.unique_id=vac.unique_id
group by 1;
