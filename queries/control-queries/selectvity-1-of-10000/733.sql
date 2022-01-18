select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 776 and ss.ss_hash <= 796 and c.c_hash >= 595 and c.c_hash <= 645 and d.d_hash >= 404 and d.d_hash <= 504
;
