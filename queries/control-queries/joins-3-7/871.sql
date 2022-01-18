select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 282 and ss.ss_hash <= 615 and hd.hd_hash >= 569 and hd.hd_hash <= 969 and cd.cd_hash >= 49 and cd.cd_hash <= 799
;
