select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 117 and ss.ss_hash <= 217 and c.c_hash >= 592 and c.c_hash <= 792 and hd.hd_hash >= 274 and hd.hd_hash <= 324
;
