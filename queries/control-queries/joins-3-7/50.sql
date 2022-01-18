select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 169 and ss.ss_hash <= 502 and cd.cd_hash >= 75 and cd.cd_hash <= 475 and d.d_hash >= 60 and d.d_hash <= 810
;
