select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 17 and ss.ss_hash <= 37 and cd.cd_hash >= 146 and cd.cd_hash <= 196 and hd.hd_hash >= 648 and hd.hd_hash <= 748
;
