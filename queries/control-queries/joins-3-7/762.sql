select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 168 and ss.ss_hash <= 918 and d.d_hash >= 641 and d.d_hash <= 974 and hd.hd_hash >= 565 and hd.hd_hash <= 965
;
