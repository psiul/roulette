select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 8 and ss.ss_hash <= 341 and cd.cd_hash >= 574 and cd.cd_hash <= 974 and hd.hd_hash >= 79 and hd.hd_hash <= 829
;
