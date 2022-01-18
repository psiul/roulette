select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 740 and hd.hd_hash <= 840 and cd.cd_hash >= 647 and cd.cd_hash <= 847 and c.c_hash >= 371 and c.c_hash <= 421
;
