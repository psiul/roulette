select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 113 and ss.ss_hash <= 863 and hd.hd_hash >= 206 and hd.hd_hash <= 606 and cd.cd_hash >= 103 and cd.cd_hash <= 436
;
