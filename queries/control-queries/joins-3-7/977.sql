select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 565 and ss.ss_hash <= 898 and c.c_hash >= 163 and c.c_hash <= 913 and hd.hd_hash >= 288 and hd.hd_hash <= 688
;
