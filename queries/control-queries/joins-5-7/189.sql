select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 136 and ss.ss_hash <= 886 and c.c_hash >= 51 and c.c_hash <= 451 and hd.hd_hash >= 528 and hd.hd_hash <= 861
;
