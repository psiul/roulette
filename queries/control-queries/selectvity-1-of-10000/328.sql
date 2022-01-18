select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 439 and ss.ss_hash <= 459 and i.i_hash >= 45 and i.i_hash <= 95 and c.c_hash >= 736 and c.c_hash <= 836
;
