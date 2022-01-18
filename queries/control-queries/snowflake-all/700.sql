select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 130 and ss.ss_hash <= 880 and cd.cd_hash >= 89 and cd.cd_hash <= 489 and c.c_hash >= 427 and c.c_hash <= 760
;
