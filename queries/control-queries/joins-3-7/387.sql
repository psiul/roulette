select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 13 and ss.ss_hash <= 346 and d.d_hash >= 39 and d.d_hash <= 439 and cd.cd_hash >= 68 and cd.cd_hash <= 818
;
