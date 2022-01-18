select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 35 and ss.ss_hash <= 785 and cd.cd_hash >= 108 and cd.cd_hash <= 508 and hd.hd_hash >= 438 and hd.hd_hash <= 771
;
