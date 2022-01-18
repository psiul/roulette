select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 315 and c.c_hash <= 815 and d.d_hash >= 11 and d.d_hash <= 211 and hd.hd_hash >= 60 and hd.hd_hash <= 160
;
