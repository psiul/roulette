select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and i.i_hash >= 41 and i.i_hash <= 374 and d.d_hash >= 570 and d.d_hash <= 970
;
