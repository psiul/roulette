select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 101 and ss.ss_hash <= 434 and c.c_hash >= 519 and c.c_hash <= 919 and hd.hd_hash >= 89 and hd.hd_hash <= 839
;
