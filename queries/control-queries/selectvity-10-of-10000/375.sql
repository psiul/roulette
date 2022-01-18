select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 714 and ss.ss_hash <= 914 and hd.hd_hash >= 554 and hd.hd_hash <= 604 and cd.cd_hash >= 771 and cd.cd_hash <= 871
;
