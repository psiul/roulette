select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 293 and ss.ss_hash <= 693 and hd.hd_hash >= 361 and hd.hd_hash <= 694 and cd.cd_hash >= 35 and cd.cd_hash <= 785
;
