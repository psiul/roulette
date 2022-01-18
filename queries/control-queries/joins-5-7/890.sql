select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 126 and ss.ss_hash <= 876 and i.i_hash >= 211 and i.i_hash <= 611 and d.d_hash >= 171 and d.d_hash <= 504
;
