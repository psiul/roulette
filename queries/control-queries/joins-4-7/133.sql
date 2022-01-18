select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 330 and ss.ss_hash <= 730 and i.i_hash >= 122 and i.i_hash <= 872 and c.c_hash >= 631 and c.c_hash <= 964
;
