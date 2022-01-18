select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 379 and ss.ss_hash <= 479 and d.d_hash >= 183 and d.d_hash <= 683 and i.i_hash >= 308 and i.i_hash <= 508
;
