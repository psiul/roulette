select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 525 and ss.ss_hash <= 858 and hd.hd_hash >= 211 and hd.hd_hash <= 611 and cd.cd_hash >= 13 and cd.cd_hash <= 763
;
