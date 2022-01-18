select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 106 and ss.ss_hash <= 856 and cd.cd_hash >= 507 and cd.cd_hash <= 840 and hd.hd_hash >= 417 and hd.hd_hash <= 817
;
