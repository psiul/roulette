select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 126 and ss.ss_hash <= 876 and c.c_hash >= 522 and c.c_hash <= 922 and cd.cd_hash >= 234 and cd.cd_hash <= 567
;
