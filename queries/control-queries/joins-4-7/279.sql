select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 108 and ss.ss_hash <= 858 and i.i_hash >= 93 and i.i_hash <= 493 and hd.hd_hash >= 490 and hd.hd_hash <= 823
;
