select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 79 and ss.ss_hash <= 179 and d.d_hash >= 398 and d.d_hash <= 448 and hd.hd_hash >= 23 and hd.hd_hash <= 223
;
