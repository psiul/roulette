select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 175 and ss.ss_hash <= 925 and hd.hd_hash >= 327 and hd.hd_hash <= 660 and c.c_hash >= 434 and c.c_hash <= 834
;
