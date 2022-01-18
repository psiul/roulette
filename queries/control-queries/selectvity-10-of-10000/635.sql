select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 581 and hd.hd_hash <= 681 and d.d_hash >= 921 and d.d_hash <= 971 and cd.cd_hash >= 26 and cd.cd_hash <= 226
;
