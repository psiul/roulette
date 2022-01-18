select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 511 and ss.ss_hash <= 911 and hd.hd_hash >= 594 and hd.hd_hash <= 927 and cd.cd_hash >= 39 and cd.cd_hash <= 789
;
