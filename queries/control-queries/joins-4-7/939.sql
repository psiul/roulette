select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 91 and ss.ss_hash <= 491 and c.c_hash >= 52 and c.c_hash <= 385 and hd.hd_hash >= 169 and hd.hd_hash <= 919
;
