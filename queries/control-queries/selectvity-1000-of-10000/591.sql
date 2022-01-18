select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 71 and ss.ss_hash <= 821 and i.i_hash >= 662 and i.i_hash <= 995 and hd.hd_hash >= 526 and hd.hd_hash <= 926
;