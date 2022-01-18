select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 789 and ss.ss_hash <= 839 and i.i_hash >= 334 and i.i_hash <= 534 and d.d_hash >= 652 and d.d_hash <= 752
;
