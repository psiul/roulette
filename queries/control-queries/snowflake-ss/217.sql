select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 406 and cd.cd_hash <= 806 and hd.hd_hash >= 90 and hd.hd_hash <= 840 and d.d_hash >= 9 and d.d_hash <= 342
;
