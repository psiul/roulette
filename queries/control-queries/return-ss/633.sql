select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 401 and ss.ss_hash <= 734 and c.c_hash >= 42 and c.c_hash <= 442 and hd.hd_hash >= 211 and hd.hd_hash <= 961
;
