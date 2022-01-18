select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 604 and ss.ss_hash <= 937 and hd.hd_hash >= 12 and hd.hd_hash <= 412 and c.c_hash >= 182 and c.c_hash <= 932
;
