select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 219 and c.c_hash <= 319 and cd.cd_hash >= 938 and cd.cd_hash <= 958 and d.d_hash >= 269 and d.d_hash <= 319
;
