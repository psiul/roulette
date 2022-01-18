select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 221 and cd.cd_hash <= 971 and c.c_hash >= 217 and c.c_hash <= 617 and d.d_hash >= 328 and d.d_hash <= 661
;
