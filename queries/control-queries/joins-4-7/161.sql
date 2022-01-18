select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 283 and ss.ss_hash <= 616 and d.d_hash >= 296 and d.d_hash <= 696 and hd.hd_hash >= 81 and hd.hd_hash <= 831
;
