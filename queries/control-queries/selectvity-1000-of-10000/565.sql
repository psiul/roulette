select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 612 and hd.hd_hash <= 945 and c.c_hash >= 124 and c.c_hash <= 874 and cd.cd_hash >= 13 and cd.cd_hash <= 413
;
