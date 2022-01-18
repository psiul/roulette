select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 540 and ss.ss_hash <= 940 and hd.hd_hash >= 192 and hd.hd_hash <= 942 and d.d_hash >= 129 and d.d_hash <= 462
;
