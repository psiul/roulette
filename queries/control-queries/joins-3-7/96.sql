select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 131 and ss.ss_hash <= 531 and hd.hd_hash >= 110 and hd.hd_hash <= 860 and cd.cd_hash >= 437 and cd.cd_hash <= 770
;
