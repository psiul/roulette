select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 48 and ss.ss_hash <= 381 and hd.hd_hash >= 18 and hd.hd_hash <= 768 and cd.cd_hash >= 238 and cd.cd_hash <= 638
;
