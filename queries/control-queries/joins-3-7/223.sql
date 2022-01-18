select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 23 and ss.ss_hash <= 773 and cd.cd_hash >= 279 and cd.cd_hash <= 679 and hd.hd_hash >= 375 and hd.hd_hash <= 708
;
