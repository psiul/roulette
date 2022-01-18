select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 311 and ss.ss_hash <= 711 and d.d_hash >= 246 and d.d_hash <= 579 and hd.hd_hash >= 17 and hd.hd_hash <= 767
;
