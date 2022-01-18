select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 679 and d.d_hash <= 729 and cd.cd_hash >= 555 and cd.cd_hash <= 655 and c.c_hash >= 66 and c.c_hash <= 86
;
