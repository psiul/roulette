select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 0 and ss.ss_hash <= 333 and d.d_hash >= 434 and d.d_hash <= 834 and hd.hd_hash >= 12 and hd.hd_hash <= 762
;
