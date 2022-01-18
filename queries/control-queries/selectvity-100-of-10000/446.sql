select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 82 and ss.ss_hash <= 582 and hd.hd_hash >= 149 and hd.hd_hash <= 349 and i.i_hash >= 16 and i.i_hash <= 116
;
