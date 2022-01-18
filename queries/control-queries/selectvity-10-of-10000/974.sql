select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 206 and i.i_hash <= 306 and d.d_hash >= 497 and d.d_hash <= 547 and hd.hd_hash >= 239 and hd.hd_hash <= 439
;
