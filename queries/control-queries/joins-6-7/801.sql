select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 248 and c.c_hash <= 581 and cd.cd_hash >= 526 and cd.cd_hash <= 926 and d.d_hash >= 167 and d.d_hash <= 917
;
