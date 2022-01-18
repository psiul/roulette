select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 132 and hd.hd_hash <= 882 and d.d_hash >= 217 and d.d_hash <= 550 and i.i_hash >= 231 and i.i_hash <= 631
;
