select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 541 and ss.ss_hash <= 874 and hd.hd_hash >= 275 and hd.hd_hash <= 675 and cd.cd_hash >= 25 and cd.cd_hash <= 775
;
