select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 148 and ss.ss_hash <= 898 and i.i_hash >= 56 and i.i_hash <= 456 and c.c_hash >= 138 and c.c_hash <= 471
;
