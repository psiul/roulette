select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 256 and ss.ss_hash <= 656 and cd.cd_hash >= 356 and cd.cd_hash <= 689 and hd.hd_hash >= 140 and hd.hd_hash <= 890
;
