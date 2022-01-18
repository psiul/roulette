select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 256 and cd.cd_hash <= 356 and d.d_hash >= 14 and d.d_hash <= 34 and c.c_hash >= 187 and c.c_hash <= 237
;
