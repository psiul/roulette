select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 476 and ss.ss_hash <= 809 and hd.hd_hash >= 312 and hd.hd_hash <= 712 and cd.cd_hash >= 37 and cd.cd_hash <= 787
;
