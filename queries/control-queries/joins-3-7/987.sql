select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 603 and ss.ss_hash <= 936 and hd.hd_hash >= 183 and hd.hd_hash <= 933 and cd.cd_hash >= 437 and cd.cd_hash <= 837
;
