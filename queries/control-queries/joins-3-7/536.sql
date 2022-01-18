select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 620 and ss.ss_hash <= 953 and cd.cd_hash >= 2 and cd.cd_hash <= 402 and hd.hd_hash >= 249 and hd.hd_hash <= 999
;
