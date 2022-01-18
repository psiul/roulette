select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 177 and c.c_hash <= 510 and cd.cd_hash >= 246 and cd.cd_hash <= 996 and hd.hd_hash >= 494 and hd.hd_hash <= 894
;
