select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 125 and ss.ss_hash <= 525 and cd.cd_hash >= 13 and cd.cd_hash <= 346 and d.d_hash >= 3 and d.d_hash <= 753
;
