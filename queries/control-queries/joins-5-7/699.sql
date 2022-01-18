select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 75 and ss.ss_hash <= 408 and cd.cd_hash >= 536 and cd.cd_hash <= 936 and d.d_hash >= 27 and d.d_hash <= 777
;
