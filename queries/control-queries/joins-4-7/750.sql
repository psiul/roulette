select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 22 and ss.ss_hash <= 772 and cd.cd_hash >= 437 and cd.cd_hash <= 837 and d.d_hash >= 470 and d.d_hash <= 803
;
