select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 461 and ss.ss_hash <= 861 and cd.cd_hash >= 113 and cd.cd_hash <= 863 and i.i_hash >= 483 and i.i_hash <= 816
;
