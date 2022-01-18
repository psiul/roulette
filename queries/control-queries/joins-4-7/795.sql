select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 149 and c.c_hash <= 482 and cd.cd_hash >= 562 and cd.cd_hash <= 962 and hd.hd_hash >= 111 and hd.hd_hash <= 861
;
