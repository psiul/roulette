select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 6 and d.d_hash <= 106 and c.c_hash >= 402 and c.c_hash <= 452 and hd.hd_hash >= 138 and hd.hd_hash <= 158
;
