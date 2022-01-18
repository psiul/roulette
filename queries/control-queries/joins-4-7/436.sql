select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 175 and ss.ss_hash <= 925 and c.c_hash >= 329 and c.c_hash <= 729 and i.i_hash >= 665 and i.i_hash <= 998
;
