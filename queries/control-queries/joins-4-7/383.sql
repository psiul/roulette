select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 213 and ss.ss_hash <= 963 and c.c_hash >= 656 and c.c_hash <= 989 and i.i_hash >= 289 and i.i_hash <= 689
;
