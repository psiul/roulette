select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 102 and ss.ss_hash <= 435 and i.i_hash >= 231 and i.i_hash <= 981 and d.d_hash >= 353 and d.d_hash <= 753
;
