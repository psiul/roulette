select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 362 and c.c_hash <= 462 and d.d_hash >= 159 and d.d_hash <= 179 and hd.hd_hash >= 793 and hd.hd_hash <= 843
;
