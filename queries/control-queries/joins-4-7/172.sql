select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 279 and i.i_hash <= 679 and hd.hd_hash >= 63 and hd.hd_hash <= 813 and d.d_hash >= 48 and d.d_hash <= 381
;
