select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 11 and ss.ss_hash <= 411 and cd.cd_hash >= 88 and cd.cd_hash <= 421 and hd.hd_hash >= 159 and hd.hd_hash <= 909
;
