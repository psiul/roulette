select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 661 and ss.ss_hash <= 994 and hd.hd_hash >= 519 and hd.hd_hash <= 919 and cd.cd_hash >= 69 and cd.cd_hash <= 819
;
