select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 367 and ss.ss_hash <= 417 and c.c_hash >= 743 and c.c_hash <= 943 and d.d_hash >= 668 and d.d_hash <= 768
;
