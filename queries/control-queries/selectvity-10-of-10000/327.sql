select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 15 and cd.cd_hash <= 65 and c.c_hash >= 20 and c.c_hash <= 120 and hd.hd_hash >= 190 and hd.hd_hash <= 390
;
