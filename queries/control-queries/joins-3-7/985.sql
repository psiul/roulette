select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 238 and ss.ss_hash <= 638 and hd.hd_hash >= 24 and hd.hd_hash <= 357 and cd.cd_hash >= 47 and cd.cd_hash <= 797
;
