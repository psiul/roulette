select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 168 and ss.ss_hash <= 918 and d.d_hash >= 505 and d.d_hash <= 905 and cd.cd_hash >= 47 and cd.cd_hash <= 380
;