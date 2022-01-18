select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 99 and i.i_hash <= 432 and c.c_hash >= 22 and c.c_hash <= 772 and hd.hd_hash >= 94 and hd.hd_hash <= 494
;
