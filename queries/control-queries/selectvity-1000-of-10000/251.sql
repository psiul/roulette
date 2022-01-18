select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 560 and ss.ss_hash <= 893 and hd.hd_hash >= 233 and hd.hd_hash <= 983 and cd.cd_hash >= 189 and cd.cd_hash <= 589
;
