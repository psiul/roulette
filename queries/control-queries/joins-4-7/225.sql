select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 172 and ss.ss_hash <= 572 and d.d_hash >= 155 and d.d_hash <= 905 and c.c_hash >= 14 and c.c_hash <= 347
;
