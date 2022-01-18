select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 361 and c.c_hash <= 761 and cd.cd_hash >= 586 and cd.cd_hash <= 919 and hd.hd_hash >= 106 and hd.hd_hash <= 856
;
