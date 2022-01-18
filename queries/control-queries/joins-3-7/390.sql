select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 273 and ss.ss_hash <= 673 and hd.hd_hash >= 100 and hd.hd_hash <= 850 and cd.cd_hash >= 400 and cd.cd_hash <= 733
;
