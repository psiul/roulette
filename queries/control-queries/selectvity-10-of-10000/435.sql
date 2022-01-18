select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 454 and ss.ss_hash <= 504 and c.c_hash >= 209 and c.c_hash <= 309 and hd.hd_hash >= 138 and hd.hd_hash <= 338
;
