select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 209 and hd.hd_hash <= 959 and c.c_hash >= 379 and c.c_hash <= 712 and d.d_hash >= 121 and d.d_hash <= 521
;