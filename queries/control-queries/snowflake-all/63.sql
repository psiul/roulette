select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 66 and ss.ss_hash <= 466 and hd.hd_hash >= 199 and hd.hd_hash <= 532 and c.c_hash >= 137 and c.c_hash <= 887
;
