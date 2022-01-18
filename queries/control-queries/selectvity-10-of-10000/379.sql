select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 153 and ss.ss_hash <= 353 and c.c_hash >= 356 and c.c_hash <= 456 and i.i_hash >= 290 and i.i_hash <= 340
;
