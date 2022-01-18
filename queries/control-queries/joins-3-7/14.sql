select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 97 and ss.ss_hash <= 497 and cd.cd_hash >= 316 and cd.cd_hash <= 649 and hd.hd_hash >= 144 and hd.hd_hash <= 894
;
