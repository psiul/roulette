select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 377 and ss.ss_hash <= 710 and cd.cd_hash >= 69 and cd.cd_hash <= 819 and hd.hd_hash >= 238 and hd.hd_hash <= 638
;
