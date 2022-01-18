select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 348 and ss.ss_hash <= 748 and cd.cd_hash >= 197 and cd.cd_hash <= 947 and hd.hd_hash >= 105 and hd.hd_hash <= 438
;
