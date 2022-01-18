select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_hash >= 333 and c.c_hash <= 383 and cd.cd_hash >= 449 and cd.cd_hash <= 469 and i.i_hash >= 680 and i.i_hash <= 780
;
