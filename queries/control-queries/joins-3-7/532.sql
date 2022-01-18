select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 520 and ss.ss_hash <= 853 and cd.cd_hash >= 49 and cd.cd_hash <= 799 and hd.hd_hash >= 37 and hd.hd_hash <= 437
;
