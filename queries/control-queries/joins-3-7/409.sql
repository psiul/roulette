select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 582 and ss.ss_hash <= 915 and cd.cd_hash >= 434 and cd.cd_hash <= 834 and hd.hd_hash >= 158 and hd.hd_hash <= 908
;
