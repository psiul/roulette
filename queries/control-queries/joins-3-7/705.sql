select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 59 and ss.ss_hash <= 392 and hd.hd_hash >= 392 and hd.hd_hash <= 792 and d.d_hash >= 224 and d.d_hash <= 974
;