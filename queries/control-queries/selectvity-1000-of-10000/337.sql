select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 87 and cd.cd_hash <= 837 and c.c_hash >= 37 and c.c_hash <= 437 and d.d_hash >= 343 and d.d_hash <= 676
;
