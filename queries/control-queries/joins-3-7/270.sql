select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 134 and ss.ss_hash <= 884 and c.c_hash >= 371 and c.c_hash <= 704 and hd.hd_hash >= 250 and hd.hd_hash <= 650
;
