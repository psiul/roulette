select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 178 and ss.ss_hash <= 578 and hd.hd_hash >= 8 and hd.hd_hash <= 758 and cd.cd_hash >= 248 and cd.cd_hash <= 581
;
