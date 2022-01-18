select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 274 and ss.ss_hash <= 774 and d.d_hash >= 22 and d.d_hash <= 122 and cd.cd_hash >= 305 and cd.cd_hash <= 505
;
