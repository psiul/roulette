select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 229 and ss.ss_hash <= 979 and hd.hd_hash >= 329 and hd.hd_hash <= 729 and c.c_hash >= 494 and c.c_hash <= 827
;
