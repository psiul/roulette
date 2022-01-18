select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 159 and ss.ss_hash <= 909 and hd.hd_hash >= 277 and hd.hd_hash <= 677 and c.c_hash >= 323 and c.c_hash <= 656
;
