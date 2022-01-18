select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 198 and ss.ss_hash <= 948 and c.c_hash >= 547 and c.c_hash <= 947 and cd.cd_hash >= 320 and cd.cd_hash <= 653
;