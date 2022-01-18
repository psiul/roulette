select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 171 and ss.ss_hash <= 921 and cd.cd_hash >= 230 and cd.cd_hash <= 563 and hd.hd_hash >= 543 and hd.hd_hash <= 943
;
