select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 132 and ss.ss_hash <= 465 and hd.hd_hash >= 43 and hd.hd_hash <= 793 and d.d_hash >= 379 and d.d_hash <= 779
;
