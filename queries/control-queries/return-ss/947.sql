select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 486 and c.c_hash <= 819 and cd.cd_hash >= 433 and cd.cd_hash <= 833 and hd.hd_hash >= 120 and hd.hd_hash <= 870
;
