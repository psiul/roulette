select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 209 and ss.ss_hash <= 959 and cd.cd_hash >= 499 and cd.cd_hash <= 832 and hd.hd_hash >= 569 and hd.hd_hash <= 969
;
