select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 218 and ss.ss_hash <= 968 and hd.hd_hash >= 259 and hd.hd_hash <= 592 and c.c_hash >= 583 and c.c_hash <= 983
;
