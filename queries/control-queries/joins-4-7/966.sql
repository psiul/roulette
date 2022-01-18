select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and cd.cd_hash >= 373 and cd.cd_hash <= 773 and hd.hd_hash >= 14 and hd.hd_hash <= 764 and c.c_hash >= 491 and c.c_hash <= 824
;
