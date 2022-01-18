select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 54 and i.i_hash <= 554 and cd.cd_hash >= 833 and cd.cd_hash <= 933 and d.d_hash >= 59 and d.d_hash <= 259
;
