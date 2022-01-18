select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 403 and ss.ss_hash <= 803 and c.c_hash >= 196 and c.c_hash <= 946 and i.i_hash >= 652 and i.i_hash <= 985
;
