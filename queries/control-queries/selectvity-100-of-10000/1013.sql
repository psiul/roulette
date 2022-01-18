select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 198 and ss.ss_hash <= 398 and cd.cd_hash >= 328 and cd.cd_hash <= 428 and c.c_hash >= 64 and c.c_hash <= 564
;
