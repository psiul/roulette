select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 78 and ss.ss_hash <= 411 and d.d_hash >= 352 and d.d_hash <= 752 and cd.cd_hash >= 244 and cd.cd_hash <= 994
;
