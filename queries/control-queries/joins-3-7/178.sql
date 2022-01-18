select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 408 and ss.ss_hash <= 741 and cd.cd_hash >= 387 and cd.cd_hash <= 787 and hd.hd_hash >= 18 and hd.hd_hash <= 768
;
