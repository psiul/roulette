select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 927 and d.d_hash <= 977 and c.c_hash >= 61 and c.c_hash <= 261 and i.i_hash >= 282 and i.i_hash <= 382
;
