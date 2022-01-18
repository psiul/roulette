select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 541 and ss.ss_hash <= 874 and c.c_hash >= 108 and c.c_hash <= 858 and hd.hd_hash >= 93 and hd.hd_hash <= 493
;
