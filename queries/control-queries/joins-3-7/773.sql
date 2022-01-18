select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 239 and ss.ss_hash <= 989 and c.c_hash >= 279 and c.c_hash <= 679 and hd.hd_hash >= 35 and hd.hd_hash <= 368
;
