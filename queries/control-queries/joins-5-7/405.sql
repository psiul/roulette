select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 639 and ss.ss_hash <= 972 and cd.cd_hash >= 507 and cd.cd_hash <= 907 and c.c_hash >= 85 and c.c_hash <= 835
;
