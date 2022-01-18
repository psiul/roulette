select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 306 and ss.ss_hash <= 639 and c.c_hash >= 191 and c.c_hash <= 941 and hd.hd_hash >= 274 and hd.hd_hash <= 674
;
