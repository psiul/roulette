select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 157 and ss.ss_hash <= 907 and cd.cd_hash >= 234 and cd.cd_hash <= 634 and hd.hd_hash >= 507 and hd.hd_hash <= 840
;
