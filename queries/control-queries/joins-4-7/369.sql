select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 364 and ss.ss_hash <= 697 and d.d_hash >= 0 and d.d_hash <= 750 and hd.hd_hash >= 528 and hd.hd_hash <= 928
;
