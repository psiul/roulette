select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 125 and cd.cd_hash <= 225 and d.d_hash >= 342 and d.d_hash <= 842 and hd.hd_hash >= 268 and hd.hd_hash <= 468
;
