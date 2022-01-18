select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 167 and ss.ss_hash <= 500 and hd.hd_hash >= 287 and hd.hd_hash <= 687 and d.d_hash >= 190 and d.d_hash <= 940
;
