select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 576 and i.i_hash <= 976 and hd.hd_hash >= 38 and hd.hd_hash <= 788 and d.d_hash >= 482 and d.d_hash <= 815
;
