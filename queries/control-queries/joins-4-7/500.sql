select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 98 and ss.ss_hash <= 848 and hd.hd_hash >= 278 and hd.hd_hash <= 678 and d.d_hash >= 562 and d.d_hash <= 895
;
