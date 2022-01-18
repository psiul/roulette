select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 95 and hd.hd_hash <= 428 and d.d_hash >= 87 and d.d_hash <= 837 and i.i_hash >= 382 and i.i_hash <= 782
;
