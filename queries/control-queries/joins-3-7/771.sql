select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 151 and ss.ss_hash <= 901 and cd.cd_hash >= 579 and cd.cd_hash <= 912 and hd.hd_hash >= 132 and hd.hd_hash <= 532
;
