select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 79 and ss.ss_hash <= 829 and hd.hd_hash >= 254 and hd.hd_hash <= 587 and cd.cd_hash >= 372 and cd.cd_hash <= 772
;
