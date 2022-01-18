select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 780 and ss.ss_hash <= 880 and cd.cd_hash >= 236 and cd.cd_hash <= 256 and c.c_hash >= 419 and c.c_hash <= 469
;
