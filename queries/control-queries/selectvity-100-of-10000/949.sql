select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 103 and ss.ss_hash <= 603 and d.d_hash >= 757 and d.d_hash <= 857 and cd.cd_hash >= 48 and cd.cd_hash <= 248
;
