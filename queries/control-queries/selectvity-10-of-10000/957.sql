select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 149 and ss.ss_hash <= 349 and c.c_hash >= 452 and c.c_hash <= 502 and hd.hd_hash >= 115 and hd.hd_hash <= 215
;
