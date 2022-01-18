select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 538 and ss.ss_hash <= 871 and cd.cd_hash >= 371 and cd.cd_hash <= 771 and hd.hd_hash >= 78 and hd.hd_hash <= 828
;
