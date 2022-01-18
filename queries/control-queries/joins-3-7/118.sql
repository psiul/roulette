select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 229 and ss.ss_hash <= 979 and hd.hd_hash >= 512 and hd.hd_hash <= 912 and cd.cd_hash >= 281 and cd.cd_hash <= 614
;
