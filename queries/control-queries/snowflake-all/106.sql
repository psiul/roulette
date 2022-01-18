select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 439 and cd.cd_hash <= 839 and i.i_hash >= 65 and i.i_hash <= 398 and d.d_hash >= 31 and d.d_hash <= 781
;
