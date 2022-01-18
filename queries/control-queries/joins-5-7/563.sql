select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 349 and c.c_hash <= 749 and d.d_hash >= 82 and d.d_hash <= 415 and i.i_hash >= 111 and i.i_hash <= 861
;
