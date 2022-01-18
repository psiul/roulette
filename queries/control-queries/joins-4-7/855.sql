select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 324 and ss.ss_hash <= 657 and i.i_hash >= 120 and i.i_hash <= 870 and d.d_hash >= 96 and d.d_hash <= 496
;
