select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 257 and cd.cd_hash <= 457 and d.d_hash >= 497 and d.d_hash <= 997 and i.i_hash >= 532 and i.i_hash <= 632
;
