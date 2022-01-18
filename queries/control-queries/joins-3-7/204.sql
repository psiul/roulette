select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 210 and ss.ss_hash <= 543 and hd.hd_hash >= 324 and hd.hd_hash <= 724 and cd.cd_hash >= 143 and cd.cd_hash <= 893
;
