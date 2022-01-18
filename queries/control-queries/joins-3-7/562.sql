select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 7 and ss.ss_hash <= 340 and cd.cd_hash >= 140 and cd.cd_hash <= 890 and hd.hd_hash >= 230 and hd.hd_hash <= 630
;
