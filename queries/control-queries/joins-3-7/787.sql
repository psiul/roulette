select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 298 and ss.ss_hash <= 698 and hd.hd_hash >= 139 and hd.hd_hash <= 889 and cd.cd_hash >= 501 and cd.cd_hash <= 834
;
