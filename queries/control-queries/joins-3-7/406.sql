select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 90 and ss.ss_hash <= 840 and hd.hd_hash >= 464 and hd.hd_hash <= 864 and d.d_hash >= 95 and d.d_hash <= 428
;
