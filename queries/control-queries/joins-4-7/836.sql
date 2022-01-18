select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 625 and ss.ss_hash <= 958 and hd.hd_hash >= 141 and hd.hd_hash <= 891 and d.d_hash >= 36 and d.d_hash <= 436
;
