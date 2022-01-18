select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 591 and d.d_hash <= 924 and cd.cd_hash >= 101 and cd.cd_hash <= 851 and hd.hd_hash >= 197 and hd.hd_hash <= 597
;
