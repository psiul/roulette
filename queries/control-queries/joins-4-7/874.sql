select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 31 and ss.ss_hash <= 781 and i.i_hash >= 414 and i.i_hash <= 814 and d.d_hash >= 380 and d.d_hash <= 713
;
