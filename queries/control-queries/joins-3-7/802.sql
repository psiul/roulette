select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 8 and ss.ss_hash <= 408 and hd.hd_hash >= 264 and hd.hd_hash <= 597 and cd.cd_hash >= 76 and cd.cd_hash <= 826
;
