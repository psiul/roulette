select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 185 and d.d_hash <= 585 and i.i_hash >= 518 and i.i_hash <= 851 and hd.hd_hash >= 33 and hd.hd_hash <= 783
;
