select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 24 and ss.ss_hash <= 424 and cd.cd_hash >= 565 and cd.cd_hash <= 898 and hd.hd_hash >= 203 and hd.hd_hash <= 953
;
