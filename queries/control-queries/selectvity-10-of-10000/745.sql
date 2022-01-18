select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 137 and ss.ss_hash <= 237 and d.d_hash >= 495 and d.d_hash <= 695 and c.c_hash >= 476 and c.c_hash <= 526
;
