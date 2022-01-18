select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 79 and ss.ss_hash <= 829 and c.c_hash >= 210 and c.c_hash <= 610 and i.i_hash >= 613 and i.i_hash <= 946
;
