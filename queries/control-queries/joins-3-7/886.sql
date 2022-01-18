select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 292 and ss.ss_hash <= 692 and hd.hd_hash >= 169 and hd.hd_hash <= 502 and cd.cd_hash >= 141 and cd.cd_hash <= 891
;
