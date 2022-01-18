select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 717 and ss.ss_hash <= 767 and d.d_hash >= 550 and d.d_hash <= 650 and c.c_hash >= 940 and c.c_hash <= 960
;
