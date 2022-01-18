select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 170 and ss.ss_hash <= 570 and i.i_hash >= 344 and i.i_hash <= 677 and c.c_hash >= 134 and c.c_hash <= 884
;