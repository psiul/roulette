select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 275 and ss.ss_hash <= 675 and c.c_hash >= 407 and c.c_hash <= 740 and hd.hd_hash >= 9 and hd.hd_hash <= 759
;
