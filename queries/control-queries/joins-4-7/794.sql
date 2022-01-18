select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 122 and cd.cd_hash <= 455 and d.d_hash >= 168 and d.d_hash <= 918 and c.c_hash >= 328 and c.c_hash <= 728
;
