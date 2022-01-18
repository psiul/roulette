select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 200 and ss.ss_hash <= 533 and d.d_hash >= 132 and d.d_hash <= 532 and cd.cd_hash >= 179 and cd.cd_hash <= 929
;
