select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 378 and cd.cd_hash <= 428 and c.c_hash >= 159 and c.c_hash <= 359 and hd.hd_hash >= 521 and hd.hd_hash <= 621
;
