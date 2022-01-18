select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 140 and ss.ss_hash <= 540 and hd.hd_hash >= 119 and hd.hd_hash <= 452 and i.i_hash >= 113 and i.i_hash <= 863
;
