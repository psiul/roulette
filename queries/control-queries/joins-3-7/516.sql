select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 121 and ss.ss_hash <= 521 and c.c_hash >= 321 and c.c_hash <= 654 and hd.hd_hash >= 22 and hd.hd_hash <= 772
;
