select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 68 and ss.ss_hash <= 818 and c.c_hash >= 59 and c.c_hash <= 392 and d.d_hash >= 25 and d.d_hash <= 425
;
