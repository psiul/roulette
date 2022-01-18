select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 247 and ss.ss_hash <= 997 and hd.hd_hash >= 423 and hd.hd_hash <= 756 and c.c_hash >= 353 and c.c_hash <= 753
;
