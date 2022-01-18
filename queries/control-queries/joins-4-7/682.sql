select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 546 and ss.ss_hash <= 879 and c.c_hash >= 486 and c.c_hash <= 886 and hd.hd_hash >= 25 and hd.hd_hash <= 775
;
