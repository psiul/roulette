select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 38 and ss.ss_hash <= 788 and cd.cd_hash >= 39 and cd.cd_hash <= 372 and hd.hd_hash >= 154 and hd.hd_hash <= 554
;
