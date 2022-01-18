select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 33 and hd.hd_hash <= 783 and i.i_hash >= 169 and i.i_hash <= 569 and d.d_hash >= 265 and d.d_hash <= 598
;
