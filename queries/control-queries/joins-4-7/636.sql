select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 74 and ss.ss_hash <= 407 and i.i_hash >= 283 and i.i_hash <= 683 and hd.hd_hash >= 33 and hd.hd_hash <= 783
;
