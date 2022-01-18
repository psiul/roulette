select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 462 and ss.ss_hash <= 862 and cd.cd_hash >= 613 and cd.cd_hash <= 946 and c.c_hash >= 152 and c.c_hash <= 902
;
