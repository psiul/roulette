select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 533 and ss.ss_hash <= 633 and c.c_hash >= 722 and c.c_hash <= 922 and i.i_hash >= 803 and i.i_hash <= 853
;
