select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 84 and ss.ss_hash <= 484 and hd.hd_hash >= 273 and hd.hd_hash <= 606 and d.d_hash >= 167 and d.d_hash <= 917
;
