select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 21 and ss.ss_hash <= 354 and d.d_hash >= 513 and d.d_hash <= 913 and hd.hd_hash >= 6 and hd.hd_hash <= 756
;
