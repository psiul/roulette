select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 84 and ss.ss_hash <= 484 and hd.hd_hash >= 571 and hd.hd_hash <= 904 and cd.cd_hash >= 96 and cd.cd_hash <= 846
;
