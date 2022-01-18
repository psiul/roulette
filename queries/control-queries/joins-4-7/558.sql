select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 407 and ss.ss_hash <= 807 and d.d_hash >= 112 and d.d_hash <= 862 and c.c_hash >= 33 and c.c_hash <= 366
;
