select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 584 and ss.ss_hash <= 917 and cd.cd_hash >= 554 and cd.cd_hash <= 954 and i.i_hash >= 234 and i.i_hash <= 984
;