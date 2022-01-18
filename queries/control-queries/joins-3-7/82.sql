select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 402 and ss.ss_hash <= 802 and cd.cd_hash >= 166 and cd.cd_hash <= 916 and hd.hd_hash >= 245 and hd.hd_hash <= 578
;
