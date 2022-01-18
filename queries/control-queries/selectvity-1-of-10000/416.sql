select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 709 and ss.ss_hash <= 759 and hd.hd_hash >= 886 and hd.hd_hash <= 906 and i.i_hash >= 380 and i.i_hash <= 480
;
