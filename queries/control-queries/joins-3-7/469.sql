select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 180 and ss.ss_hash <= 930 and c.c_hash >= 351 and c.c_hash <= 684 and hd.hd_hash >= 179 and hd.hd_hash <= 579
;
