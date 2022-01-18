select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 261 and ss.ss_hash <= 661 and hd.hd_hash >= 89 and hd.hd_hash <= 839 and d.d_hash >= 408 and d.d_hash <= 741
;
