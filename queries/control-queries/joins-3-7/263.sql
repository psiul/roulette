select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 503 and ss.ss_hash <= 903 and cd.cd_hash >= 17 and cd.cd_hash <= 767 and d.d_hash >= 485 and d.d_hash <= 818
;
