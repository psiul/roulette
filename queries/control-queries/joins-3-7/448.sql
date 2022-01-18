select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 191 and ss.ss_hash <= 941 and hd.hd_hash >= 592 and hd.hd_hash <= 925 and d.d_hash >= 336 and d.d_hash <= 736
;
