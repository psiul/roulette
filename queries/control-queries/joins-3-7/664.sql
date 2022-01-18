select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 397 and ss.ss_hash <= 797 and hd.hd_hash >= 186 and hd.hd_hash <= 936 and cd.cd_hash >= 288 and cd.cd_hash <= 621
;
