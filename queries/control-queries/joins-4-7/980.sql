select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 161 and ss.ss_hash <= 494 and i.i_hash >= 105 and i.i_hash <= 505 and hd.hd_hash >= 223 and hd.hd_hash <= 973
;
