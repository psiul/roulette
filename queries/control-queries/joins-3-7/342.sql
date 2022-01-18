select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 127 and ss.ss_hash <= 460 and hd.hd_hash >= 212 and hd.hd_hash <= 962 and cd.cd_hash >= 332 and cd.cd_hash <= 732
;
