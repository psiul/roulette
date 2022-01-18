select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 544 and ss.ss_hash <= 877 and cd.cd_hash >= 193 and cd.cd_hash <= 943 and hd.hd_hash >= 192 and hd.hd_hash <= 592
;
