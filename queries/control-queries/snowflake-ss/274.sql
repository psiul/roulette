select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 596 and ss.ss_hash <= 996 and hd.hd_hash >= 38 and hd.hd_hash <= 788 and cd.cd_hash >= 172 and cd.cd_hash <= 505
;
