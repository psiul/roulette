select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 161 and ss.ss_hash <= 911 and i.i_hash >= 233 and i.i_hash <= 566 and hd.hd_hash >= 292 and hd.hd_hash <= 692
;
