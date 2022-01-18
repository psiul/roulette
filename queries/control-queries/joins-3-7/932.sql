select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 88 and ss.ss_hash <= 838 and hd.hd_hash >= 283 and hd.hd_hash <= 616 and d.d_hash >= 233 and d.d_hash <= 633
;
