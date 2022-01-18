select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 235 and ss.ss_hash <= 568 and cd.cd_hash >= 32 and cd.cd_hash <= 432 and d.d_hash >= 178 and d.d_hash <= 928
;
