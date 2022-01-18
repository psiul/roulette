select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 493 and d.d_hash <= 893 and cd.cd_hash >= 122 and cd.cd_hash <= 872 and c.c_hash >= 181 and c.c_hash <= 514
;
