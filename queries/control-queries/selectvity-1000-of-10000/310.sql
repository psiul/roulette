select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 32 and cd.cd_hash <= 782 and d.d_hash >= 112 and d.d_hash <= 512 and i.i_hash >= 314 and i.i_hash <= 647
;