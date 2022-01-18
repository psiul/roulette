select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 1 and hd.hd_hash <= 401 and d.d_hash >= 243 and d.d_hash <= 576 and i.i_hash >= 60 and i.i_hash <= 810
;
