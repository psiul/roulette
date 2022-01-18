select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 652 and hd.hd_hash <= 702 and cd.cd_hash >= 354 and cd.cd_hash <= 454 and c.c_hash >= 536 and c.c_hash <= 736
;
