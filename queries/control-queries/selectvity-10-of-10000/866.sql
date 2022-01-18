select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 124 and ss.ss_hash <= 224 and cd.cd_hash >= 166 and cd.cd_hash <= 366 and i.i_hash >= 592 and i.i_hash <= 642
;
