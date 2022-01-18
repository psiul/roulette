select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 49 and ss.ss_hash <= 382 and i.i_hash >= 145 and i.i_hash <= 895 and hd.hd_hash >= 396 and hd.hd_hash <= 796
;
