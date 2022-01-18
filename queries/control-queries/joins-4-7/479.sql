select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 598 and d.d_hash <= 998 and hd.hd_hash >= 175 and hd.hd_hash <= 925 and i.i_hash >= 6 and i.i_hash <= 339
;
