select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 99 and ss.ss_hash <= 149 and i.i_hash >= 813 and i.i_hash <= 833 and c.c_hash >= 660 and c.c_hash <= 760
;
