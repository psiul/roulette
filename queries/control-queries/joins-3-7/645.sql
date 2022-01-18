select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 11 and ss.ss_hash <= 344 and hd.hd_hash >= 174 and hd.hd_hash <= 924 and cd.cd_hash >= 360 and cd.cd_hash <= 760
;
