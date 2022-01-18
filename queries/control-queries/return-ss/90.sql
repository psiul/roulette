select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 306 and cd.cd_hash <= 706 and c.c_hash >= 243 and c.c_hash <= 993 and hd.hd_hash >= 251 and hd.hd_hash <= 584
;
