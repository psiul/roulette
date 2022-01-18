select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 38 and c.c_hash <= 371 and cd.cd_hash >= 325 and cd.cd_hash <= 725 and d.d_hash >= 178 and d.d_hash <= 928
;
