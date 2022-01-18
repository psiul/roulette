select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 535 and ss.ss_hash <= 935 and cd.cd_hash >= 170 and cd.cd_hash <= 920 and hd.hd_hash >= 583 and hd.hd_hash <= 916
;
