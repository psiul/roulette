select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 100 and ss.ss_hash <= 200 and i.i_hash >= 774 and i.i_hash <= 794 and d.d_hash >= 764 and d.d_hash <= 814
;
