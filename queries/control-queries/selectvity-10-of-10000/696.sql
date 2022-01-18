select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 239 and ss.ss_hash <= 289 and d.d_hash >= 428 and d.d_hash <= 628 and hd.hd_hash >= 889 and hd.hd_hash <= 989
;
