select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 602 and ss.ss_hash <= 935 and cd.cd_hash >= 500 and cd.cd_hash <= 900 and d.d_hash >= 220 and d.d_hash <= 970
;
