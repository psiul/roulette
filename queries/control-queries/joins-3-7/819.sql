select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 150 and ss.ss_hash <= 900 and hd.hd_hash >= 333 and hd.hd_hash <= 666 and c.c_hash >= 539 and c.c_hash <= 939
;
