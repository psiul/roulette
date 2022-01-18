select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 163 and c.c_hash <= 913 and d.d_hash >= 72 and d.d_hash <= 405 and cd.cd_hash >= 578 and cd.cd_hash <= 978
;
