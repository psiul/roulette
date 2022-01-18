select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 516 and ss.ss_hash <= 916 and cd.cd_hash >= 140 and cd.cd_hash <= 473 and hd.hd_hash >= 93 and hd.hd_hash <= 843
;
