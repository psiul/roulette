select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 577 and ss.ss_hash <= 977 and hd.hd_hash >= 215 and hd.hd_hash <= 548 and d.d_hash >= 87 and d.d_hash <= 837
;
