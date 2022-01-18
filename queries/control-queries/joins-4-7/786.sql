select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 171 and ss.ss_hash <= 504 and c.c_hash >= 34 and c.c_hash <= 784 and d.d_hash >= 470 and d.d_hash <= 870
;
