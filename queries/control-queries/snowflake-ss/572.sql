select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 180 and i.i_hash <= 580 and d.d_hash >= 40 and d.d_hash <= 790 and c.c_hash >= 504 and c.c_hash <= 837
;
