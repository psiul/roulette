select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 179 and ss.ss_hash <= 929 and hd.hd_hash >= 247 and hd.hd_hash <= 580 and cd.cd_hash >= 196 and cd.cd_hash <= 596
;
