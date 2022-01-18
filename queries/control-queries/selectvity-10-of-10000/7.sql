select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 24 and ss.ss_hash <= 224 and i.i_hash >= 884 and i.i_hash <= 934 and d.d_hash >= 348 and d.d_hash <= 448
;
