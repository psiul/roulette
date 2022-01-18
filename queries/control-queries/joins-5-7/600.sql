select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 192 and ss.ss_hash <= 942 and d.d_hash >= 370 and d.d_hash <= 770 and c.c_hash >= 288 and c.c_hash <= 621
;
