select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 209 and ss.ss_hash <= 959 and cd.cd_hash >= 426 and cd.cd_hash <= 826 and hd.hd_hash >= 512 and hd.hd_hash <= 845
;
