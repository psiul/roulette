select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 553 and ss.ss_hash <= 886 and hd.hd_hash >= 116 and hd.hd_hash <= 866 and d.d_hash >= 78 and d.d_hash <= 478
;
