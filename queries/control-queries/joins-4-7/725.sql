select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 287 and ss.ss_hash <= 687 and hd.hd_hash >= 279 and hd.hd_hash <= 612 and cd.cd_hash >= 39 and cd.cd_hash <= 789
;
