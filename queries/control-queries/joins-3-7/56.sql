select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 328 and ss.ss_hash <= 728 and c.c_hash >= 105 and c.c_hash <= 438 and hd.hd_hash >= 78 and hd.hd_hash <= 828
;
