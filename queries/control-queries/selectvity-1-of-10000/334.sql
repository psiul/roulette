select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 164 and ss.ss_hash <= 264 and c.c_hash >= 461 and c.c_hash <= 481 and hd.hd_hash >= 147 and hd.hd_hash <= 197
;
