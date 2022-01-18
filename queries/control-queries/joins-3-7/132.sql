select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 539 and ss.ss_hash <= 939 and hd.hd_hash >= 4 and hd.hd_hash <= 754 and cd.cd_hash >= 433 and cd.cd_hash <= 766
;
