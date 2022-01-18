select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 518 and ss.ss_hash <= 851 and cd.cd_hash >= 184 and cd.cd_hash <= 934 and hd.hd_hash >= 196 and hd.hd_hash <= 596
;
