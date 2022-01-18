select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 343 and d.d_hash <= 676 and c.c_hash >= 219 and c.c_hash <= 619 and cd.cd_hash >= 179 and cd.cd_hash <= 929
;
