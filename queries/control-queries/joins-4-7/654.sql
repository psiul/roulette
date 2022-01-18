select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 491 and ss.ss_hash <= 824 and hd.hd_hash >= 153 and hd.hd_hash <= 903 and d.d_hash >= 157 and d.d_hash <= 557
;
