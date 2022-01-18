select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 110 and ss.ss_hash <= 443 and cd.cd_hash >= 298 and cd.cd_hash <= 698 and hd.hd_hash >= 223 and hd.hd_hash <= 973
;
