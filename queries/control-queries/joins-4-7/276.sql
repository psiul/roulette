select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 112 and ss.ss_hash <= 862 and c.c_hash >= 560 and c.c_hash <= 960 and d.d_hash >= 92 and d.d_hash <= 425
;
