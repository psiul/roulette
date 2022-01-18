select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 517 and ss.ss_hash <= 917 and cd.cd_hash >= 268 and cd.cd_hash <= 601 and hd.hd_hash >= 77 and hd.hd_hash <= 827
;
