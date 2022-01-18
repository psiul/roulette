select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 29 and ss.ss_hash <= 362 and hd.hd_hash >= 124 and hd.hd_hash <= 874 and i.i_hash >= 137 and i.i_hash <= 537
;
