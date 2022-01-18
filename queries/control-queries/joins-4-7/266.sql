select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 131 and d.d_hash <= 464 and i.i_hash >= 198 and i.i_hash <= 948 and hd.hd_hash >= 452 and hd.hd_hash <= 852
;
