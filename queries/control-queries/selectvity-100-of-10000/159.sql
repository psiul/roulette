select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 294 and c.c_hash <= 494 and hd.hd_hash >= 298 and hd.hd_hash <= 398 and i.i_hash >= 123 and i.i_hash <= 623
;
