select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 66 and ss.ss_hash <= 816 and hd.hd_hash >= 84 and hd.hd_hash <= 484 and cd.cd_hash >= 106 and cd.cd_hash <= 439
;
