select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 512 and ss.ss_hash <= 845 and cd.cd_hash >= 95 and cd.cd_hash <= 845 and d.d_hash >= 199 and d.d_hash <= 599
;
