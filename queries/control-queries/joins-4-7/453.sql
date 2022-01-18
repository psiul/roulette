select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 208 and ss.ss_hash <= 958 and i.i_hash >= 173 and i.i_hash <= 506 and d.d_hash >= 0 and d.d_hash <= 400
;
