select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 223 and ss.ss_hash <= 556 and cd.cd_hash >= 256 and cd.cd_hash <= 656 and hd.hd_hash >= 27 and hd.hd_hash <= 777
;
