select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 152 and ss.ss_hash <= 485 and hd.hd_hash >= 67 and hd.hd_hash <= 817 and cd.cd_hash >= 55 and cd.cd_hash <= 455
;
