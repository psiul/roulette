select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 663 and hd.hd_hash <= 996 and c.c_hash >= 50 and c.c_hash <= 800 and d.d_hash >= 54 and d.d_hash <= 454
;
