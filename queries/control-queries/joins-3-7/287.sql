select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 82 and ss.ss_hash <= 832 and hd.hd_hash >= 586 and hd.hd_hash <= 986 and cd.cd_hash >= 275 and cd.cd_hash <= 608
;
