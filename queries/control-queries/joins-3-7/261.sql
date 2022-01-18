select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 212 and ss.ss_hash <= 962 and hd.hd_hash >= 351 and hd.hd_hash <= 684 and c.c_hash >= 331 and c.c_hash <= 731
;
