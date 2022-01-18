select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 207 and c.c_hash <= 540 and d.d_hash >= 238 and d.d_hash <= 988 and cd.cd_hash >= 25 and cd.cd_hash <= 425
;
