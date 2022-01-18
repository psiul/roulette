select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 131 and ss.ss_hash <= 881 and cd.cd_hash >= 64 and cd.cd_hash <= 397 and hd.hd_hash >= 499 and hd.hd_hash <= 899
;
