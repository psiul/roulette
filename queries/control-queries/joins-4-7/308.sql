select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 10 and i.i_hash <= 760 and c.c_hash >= 219 and c.c_hash <= 552 and hd.hd_hash >= 228 and hd.hd_hash <= 628
;
