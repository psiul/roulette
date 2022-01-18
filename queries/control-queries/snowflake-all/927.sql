select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 361 and ss.ss_hash <= 694 and hd.hd_hash >= 4 and hd.hd_hash <= 754 and cd.cd_hash >= 353 and cd.cd_hash <= 753
;
