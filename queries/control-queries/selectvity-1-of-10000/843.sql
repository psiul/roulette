select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 537 and d.d_hash <= 587 and i.i_hash >= 436 and i.i_hash <= 456 and cd.cd_hash >= 88 and cd.cd_hash <= 188
;
