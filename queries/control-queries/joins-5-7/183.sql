select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 417 and ss.ss_hash <= 817 and d.d_hash >= 456 and d.d_hash <= 789 and c.c_hash >= 105 and c.c_hash <= 855
;
