select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 87 and ss.ss_hash <= 837 and i.i_hash >= 0 and i.i_hash <= 400 and d.d_hash >= 121 and d.d_hash <= 454
;
