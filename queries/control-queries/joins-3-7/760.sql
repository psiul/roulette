select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 557 and ss.ss_hash <= 957 and hd.hd_hash >= 406 and hd.hd_hash <= 739 and cd.cd_hash >= 162 and cd.cd_hash <= 912
;
