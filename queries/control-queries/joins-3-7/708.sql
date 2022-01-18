select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 159 and ss.ss_hash <= 909 and hd.hd_hash >= 507 and hd.hd_hash <= 907 and c.c_hash >= 605 and c.c_hash <= 938
;
