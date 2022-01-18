select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 526 and ss.ss_hash <= 859 and hd.hd_hash >= 435 and hd.hd_hash <= 835 and c.c_hash >= 126 and c.c_hash <= 876
;
