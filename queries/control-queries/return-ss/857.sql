select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 554 and c.c_hash <= 954 and d.d_hash >= 658 and d.d_hash <= 991 and cd.cd_hash >= 239 and cd.cd_hash <= 989
;
