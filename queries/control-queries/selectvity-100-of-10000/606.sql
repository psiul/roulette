select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 876 and ss.ss_hash <= 976 and d.d_hash >= 72 and d.d_hash <= 572 and c.c_hash >= 8 and c.c_hash <= 208
;
