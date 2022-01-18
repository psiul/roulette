select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 180 and cd.cd_hash <= 513 and c.c_hash >= 583 and c.c_hash <= 983 and hd.hd_hash >= 102 and hd.hd_hash <= 852
;
