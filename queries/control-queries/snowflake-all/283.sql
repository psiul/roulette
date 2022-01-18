select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 137 and cd.cd_hash <= 537 and hd.hd_hash >= 195 and hd.hd_hash <= 528 and c.c_hash >= 195 and c.c_hash <= 945
;
