select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 62 and ss.ss_hash <= 812 and d.d_hash >= 567 and d.d_hash <= 900 and c.c_hash >= 28 and c.c_hash <= 428
;
