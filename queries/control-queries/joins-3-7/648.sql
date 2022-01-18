select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 128 and ss.ss_hash <= 878 and cd.cd_hash >= 617 and cd.cd_hash <= 950 and hd.hd_hash >= 257 and hd.hd_hash <= 657
;
