select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 816 and i.i_hash <= 916 and hd.hd_hash >= 781 and hd.hd_hash <= 981 and c.c_hash >= 742 and c.c_hash <= 792
;
