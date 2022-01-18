select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 251 and ss.ss_hash <= 651 and c.c_hash >= 490 and c.c_hash <= 823 and hd.hd_hash >= 132 and hd.hd_hash <= 882
;
