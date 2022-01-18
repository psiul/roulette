select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 703 and ss.ss_hash <= 723 and i.i_hash >= 266 and i.i_hash <= 316 and cd.cd_hash >= 307 and cd.cd_hash <= 407
;
