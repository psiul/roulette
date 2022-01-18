select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 139 and ss.ss_hash <= 889 and hd.hd_hash >= 253 and hd.hd_hash <= 653 and d.d_hash >= 422 and d.d_hash <= 755
;
