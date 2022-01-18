select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 52 and ss.ss_hash <= 452 and cd.cd_hash >= 50 and cd.cd_hash <= 383 and hd.hd_hash >= 38 and hd.hd_hash <= 788
;
