select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 99 and ss.ss_hash <= 849 and hd.hd_hash >= 372 and hd.hd_hash <= 772 and cd.cd_hash >= 567 and cd.cd_hash <= 900
;
