select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 346 and ss.ss_hash <= 746 and cd.cd_hash >= 247 and cd.cd_hash <= 997 and hd.hd_hash >= 299 and hd.hd_hash <= 632
;
