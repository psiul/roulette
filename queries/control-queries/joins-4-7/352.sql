select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 5 and cd.cd_hash <= 338 and d.d_hash >= 195 and d.d_hash <= 945 and c.c_hash >= 471 and c.c_hash <= 871
;
