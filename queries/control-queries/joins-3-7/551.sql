select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 96 and ss.ss_hash <= 429 and cd.cd_hash >= 330 and cd.cd_hash <= 730 and hd.hd_hash >= 194 and hd.hd_hash <= 944
;
