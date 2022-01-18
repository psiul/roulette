select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 343 and c.c_hash <= 443 and d.d_hash >= 563 and d.d_hash <= 763 and i.i_hash >= 194 and i.i_hash <= 694
;
