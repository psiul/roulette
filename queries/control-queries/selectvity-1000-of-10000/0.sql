select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 321 and ss.ss_hash <= 654 and cd.cd_hash >= 255 and cd.cd_hash <= 655 and d.d_hash >= 54 and d.d_hash <= 804
;
