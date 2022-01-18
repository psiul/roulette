select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 202 and ss.ss_hash <= 535 and i.i_hash >= 202 and i.i_hash <= 952 and d.d_hash >= 142 and d.d_hash <= 542
;