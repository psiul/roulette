select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 409 and ss.ss_hash <= 809 and d.d_hash >= 59 and d.d_hash <= 392 and hd.hd_hash >= 77 and hd.hd_hash <= 827
;
