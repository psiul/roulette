select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 220 and ss.ss_hash <= 970 and c.c_hash >= 8 and c.c_hash <= 408 and hd.hd_hash >= 61 and hd.hd_hash <= 394
;
