select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 114 and hd.hd_hash <= 514 and cd.cd_hash >= 16 and cd.cd_hash <= 766 and c.c_hash >= 476 and c.c_hash <= 809
;
