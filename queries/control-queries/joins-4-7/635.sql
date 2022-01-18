select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 550 and ss.ss_hash <= 883 and cd.cd_hash >= 546 and cd.cd_hash <= 946 and hd.hd_hash >= 79 and hd.hd_hash <= 829
;
