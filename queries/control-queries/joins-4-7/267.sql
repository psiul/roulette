select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 203 and d.d_hash <= 603 and i.i_hash >= 9 and i.i_hash <= 759 and hd.hd_hash >= 419 and hd.hd_hash <= 752
;
