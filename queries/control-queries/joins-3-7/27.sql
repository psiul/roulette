select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 235 and ss.ss_hash <= 568 and c.c_hash >= 34 and c.c_hash <= 784 and hd.hd_hash >= 219 and hd.hd_hash <= 619
;
