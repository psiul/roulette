select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 223 and hd.hd_hash <= 423 and c.c_hash >= 94 and c.c_hash <= 194 and cd.cd_hash >= 14 and cd.cd_hash <= 514
;
