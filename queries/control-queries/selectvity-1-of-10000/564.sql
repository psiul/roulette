select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 682 and ss.ss_hash <= 782 and i.i_hash >= 696 and i.i_hash <= 746 and cd.cd_hash >= 702 and cd.cd_hash <= 722
;
