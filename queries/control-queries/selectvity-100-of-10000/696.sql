select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 529 and cd.cd_hash <= 729 and c.c_hash >= 401 and c.c_hash <= 501 and hd.hd_hash >= 398 and hd.hd_hash <= 898
;
