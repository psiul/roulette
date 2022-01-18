select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 237 and ss.ss_hash <= 987 and d.d_hash >= 46 and d.d_hash <= 379 and i.i_hash >= 113 and i.i_hash <= 513
;
