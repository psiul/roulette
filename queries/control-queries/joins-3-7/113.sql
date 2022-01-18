select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 119 and ss.ss_hash <= 452 and hd.hd_hash >= 10 and hd.hd_hash <= 760 and d.d_hash >= 228 and d.d_hash <= 628
;
