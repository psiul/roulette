select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 366 and d.d_hash <= 566 and i.i_hash >= 14 and i.i_hash <= 114 and hd.hd_hash >= 258 and hd.hd_hash <= 308
;
