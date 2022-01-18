select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 283 and ss.ss_hash <= 683 and d.d_hash >= 17 and d.d_hash <= 767 and hd.hd_hash >= 75 and hd.hd_hash <= 408
;
