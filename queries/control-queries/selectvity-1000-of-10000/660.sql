select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 428 and ss.ss_hash <= 761 and c.c_hash >= 190 and c.c_hash <= 940 and hd.hd_hash >= 40 and hd.hd_hash <= 440
;
