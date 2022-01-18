select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 193 and ss.ss_hash <= 593 and c.c_hash >= 86 and c.c_hash <= 836 and hd.hd_hash >= 336 and hd.hd_hash <= 669
;
