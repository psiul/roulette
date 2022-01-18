select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 132 and ss.ss_hash <= 465 and cd.cd_hash >= 36 and cd.cd_hash <= 786 and hd.hd_hash >= 212 and hd.hd_hash <= 612
;
