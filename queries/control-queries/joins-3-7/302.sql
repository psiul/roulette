select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 111 and ss.ss_hash <= 511 and hd.hd_hash >= 113 and hd.hd_hash <= 863 and cd.cd_hash >= 75 and cd.cd_hash <= 408
;
