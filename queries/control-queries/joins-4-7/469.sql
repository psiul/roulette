select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 143 and ss.ss_hash <= 893 and i.i_hash >= 253 and i.i_hash <= 653 and d.d_hash >= 359 and d.d_hash <= 692
;
