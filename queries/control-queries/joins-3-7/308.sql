select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 146 and ss.ss_hash <= 479 and hd.hd_hash >= 481 and hd.hd_hash <= 881 and c.c_hash >= 86 and c.c_hash <= 836
;
