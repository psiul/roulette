select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 729 and ss.ss_hash <= 779 and cd.cd_hash >= 309 and cd.cd_hash <= 329 and hd.hd_hash >= 376 and hd.hd_hash <= 476
;
