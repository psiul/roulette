select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 154 and ss.ss_hash <= 904 and hd.hd_hash >= 59 and hd.hd_hash <= 459 and cd.cd_hash >= 299 and cd.cd_hash <= 632
;
