select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 217 and i.i_hash <= 267 and d.d_hash >= 468 and d.d_hash <= 668 and cd.cd_hash >= 406 and cd.cd_hash <= 506
;
