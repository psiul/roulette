select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 501 and ss.ss_hash <= 901 and cd.cd_hash >= 598 and cd.cd_hash <= 931 and d.d_hash >= 118 and d.d_hash <= 868
;
