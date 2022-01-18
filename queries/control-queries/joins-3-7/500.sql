select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 414 and ss.ss_hash <= 747 and d.d_hash >= 163 and d.d_hash <= 913 and hd.hd_hash >= 398 and hd.hd_hash <= 798
;
