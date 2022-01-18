select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 280 and ss.ss_hash <= 613 and hd.hd_hash >= 229 and hd.hd_hash <= 629 and c.c_hash >= 130 and c.c_hash <= 880
;
