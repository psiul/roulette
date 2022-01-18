select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 20 and ss.ss_hash <= 770 and c.c_hash >= 112 and c.c_hash <= 445 and cd.cd_hash >= 545 and cd.cd_hash <= 945
;
