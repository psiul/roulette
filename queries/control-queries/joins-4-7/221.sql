select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and i.i_hash >= 573 and i.i_hash <= 906 and d.d_hash >= 224 and d.d_hash <= 624
;
