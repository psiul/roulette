select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 548 and ss.ss_hash <= 881 and c.c_hash >= 145 and c.c_hash <= 895 and hd.hd_hash >= 202 and hd.hd_hash <= 602
;
