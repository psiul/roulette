select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 256 and ss.ss_hash <= 656 and c.c_hash >= 101 and c.c_hash <= 434 and cd.cd_hash >= 195 and cd.cd_hash <= 945
;