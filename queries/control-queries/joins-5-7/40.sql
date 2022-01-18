select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 275 and ss.ss_hash <= 608 and hd.hd_hash >= 468 and hd.hd_hash <= 868 and cd.cd_hash >= 179 and cd.cd_hash <= 929
;
