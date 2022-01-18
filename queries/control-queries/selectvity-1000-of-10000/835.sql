select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 109 and ss.ss_hash <= 442 and hd.hd_hash >= 94 and hd.hd_hash <= 494 and c.c_hash >= 15 and c.c_hash <= 765
;
