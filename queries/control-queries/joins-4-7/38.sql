select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 110 and ss.ss_hash <= 860 and d.d_hash >= 450 and d.d_hash <= 850 and hd.hd_hash >= 127 and hd.hd_hash <= 460
;
