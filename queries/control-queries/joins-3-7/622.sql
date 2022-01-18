select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 147 and ss.ss_hash <= 480 and hd.hd_hash >= 62 and hd.hd_hash <= 812 and d.d_hash >= 535 and d.d_hash <= 935
;
