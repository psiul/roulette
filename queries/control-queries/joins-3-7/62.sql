select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 51 and ss.ss_hash <= 801 and hd.hd_hash >= 489 and hd.hd_hash <= 889 and cd.cd_hash >= 313 and cd.cd_hash <= 646
;
