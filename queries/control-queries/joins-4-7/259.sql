select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 241 and ss.ss_hash <= 574 and hd.hd_hash >= 141 and hd.hd_hash <= 541 and i.i_hash >= 52 and i.i_hash <= 802
;
