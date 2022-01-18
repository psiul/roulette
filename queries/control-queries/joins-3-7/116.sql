select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 185 and ss.ss_hash <= 935 and cd.cd_hash >= 88 and cd.cd_hash <= 421 and d.d_hash >= 557 and d.d_hash <= 957
;
