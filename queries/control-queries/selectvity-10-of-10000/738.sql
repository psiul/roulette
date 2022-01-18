select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 68 and ss.ss_hash <= 168 and c.c_hash >= 204 and c.c_hash <= 254 and hd.hd_hash >= 779 and hd.hd_hash <= 979
;
