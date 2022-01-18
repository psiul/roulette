select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 477 and ss.ss_hash <= 877 and cd.cd_hash >= 135 and cd.cd_hash <= 885 and hd.hd_hash >= 0 and hd.hd_hash <= 333
;
