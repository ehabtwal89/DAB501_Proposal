SELECT  DISTINCT 

--MR.[UNITID]
      --,MR.[OPEID]
      --,MR.[OPEID6]
      --MR.[INSTNM]
      --,MR.[CITY]
      --,
	  MR.[STABBR]
      --,MR.[ZIP]
      --,MR.[ACCREDAGENCY]
      --,MR.[INSTURL]
      --,MR.[NPCURL]
      --,MR.[SCH_DEG]
      --,MR.[HCM2]
   --   --,
	  --MR.[LPSTAFFORD_CNT] as 'Number of Undergrad Staudents'
	  --   ,MR.[LPGPLUS_CNT] as 'Number of Grad Staudents'
		 , 
		 sum(cast(MR.[LPSTAFFORD_CNT] as int)) + sum(cast( MR.[LPGPLUS_CNT] as int) )as 'Total Number of All Students'
      --,MR.[LPSTAFFORD_AMT] as 'Total Debt Amount for Undergrad Staudents'
      --,MR.[LPPPLUS_CNT]
      --,MR.[LPPPLUS_AMT]
   
      --,MR.[LPGPLUS_AMT] as 'Total Debt Amount for Grad Staudents'


	  , sum(cast(MR.[LPSTAFFORD_AMT] as money)) + sum(cast(MR.[LPGPLUS_AMT] as money))as 'Total Debt for All Students'


	  , avg(cast(MRS.[SAT_AVG] as int ) ) as SAT_AVG
	  --,MRS.[SAT_AVG_ALL]
	  ,MRS2.MD_EARN_WNE_P10

  FROM [most_resent_data].[dbo].[Most-Recent-Cohorts-Institution_05192025_Edited] MR
  INNER JOIN [dbo].[MostRecent] MRS ON MR.[UNITID] = MRS.[UNITID]
  INNER JOIN [most_resent_data].[dbo].[Most-Recent-Cohorts-Institution_05192025_Edit2] MRS2 ON  MR.[UNITID] = MRS2.[UNITID]
  WHERE MRS.[SAT_AVG] != 'NULL'
  and MR.[LPSTAFFORD_CNT] not in ('ps','na')
  and MR.[LPGPLUS_CNT] not in ('ps','na')
  and MRS.[SAT_AVG] != 'NULL'

  group by   MR.[STABBR] ,MRS2.MD_EARN_WNE_P10
  --order by MR.[STABBR], [SAT_AVG] 