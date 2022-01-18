select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 44 and ss.ss_hash <= 794 and hd.hd_hash >= 307 and hd.hd_hash <= 707 and d.d_hash >= 169 and d.d_hash <= 502
;
