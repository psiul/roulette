select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 726 and ss.ss_hash <= 746 and c.c_hash >= 19 and c.c_hash <= 69 and cd.cd_hash >= 54 and cd.cd_hash <= 154
;
