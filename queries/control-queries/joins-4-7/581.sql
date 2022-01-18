select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 481 and ss.ss_hash <= 814 and c.c_hash >= 221 and c.c_hash <= 971 and i.i_hash >= 380 and i.i_hash <= 780
;
