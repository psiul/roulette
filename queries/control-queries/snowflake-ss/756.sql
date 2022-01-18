select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 64 and ss.ss_hash <= 464 and hd.hd_hash >= 292 and hd.hd_hash <= 625 and d.d_hash >= 233 and d.d_hash <= 983
;