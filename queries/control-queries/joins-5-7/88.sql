select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 494 and ss.ss_hash <= 827 and i.i_hash >= 346 and i.i_hash <= 746 and c.c_hash >= 78 and c.c_hash <= 828
;
