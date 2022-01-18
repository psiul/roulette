select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 156 and ss.ss_hash <= 906 and c.c_hash >= 108 and c.c_hash <= 508 and hd.hd_hash >= 284 and hd.hd_hash <= 617
;
