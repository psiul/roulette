select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 93 and ss.ss_hash <= 493 and hd.hd_hash >= 75 and hd.hd_hash <= 825 and d.d_hash >= 90 and d.d_hash <= 423
;
