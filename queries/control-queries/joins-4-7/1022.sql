select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 95 and ss.ss_hash <= 845 and cd.cd_hash >= 442 and cd.cd_hash <= 842 and hd.hd_hash >= 368 and hd.hd_hash <= 701
;
