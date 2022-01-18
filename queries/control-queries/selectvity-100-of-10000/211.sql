select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 355 and cd.cd_hash <= 455 and d.d_hash >= 116 and d.d_hash <= 616 and i.i_hash >= 238 and i.i_hash <= 438
;
