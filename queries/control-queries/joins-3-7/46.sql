select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 241 and ss.ss_hash <= 641 and hd.hd_hash >= 243 and hd.hd_hash <= 576 and cd.cd_hash >= 148 and cd.cd_hash <= 898
;
