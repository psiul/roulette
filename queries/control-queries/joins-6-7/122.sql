select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 161 and ss.ss_hash <= 911 and d.d_hash >= 25 and d.d_hash <= 425 and c.c_hash >= 525 and c.c_hash <= 858
;
