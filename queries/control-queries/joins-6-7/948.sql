select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 468 and ss.ss_hash <= 801 and d.d_hash >= 227 and d.d_hash <= 977 and c.c_hash >= 302 and c.c_hash <= 702
;
