select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 117 and ss.ss_hash <= 517 and hd.hd_hash >= 51 and hd.hd_hash <= 801 and cd.cd_hash >= 180 and cd.cd_hash <= 513
;
