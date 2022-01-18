select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 44 and ss.ss_hash <= 377 and d.d_hash >= 224 and d.d_hash <= 974 and hd.hd_hash >= 156 and hd.hd_hash <= 556
;
