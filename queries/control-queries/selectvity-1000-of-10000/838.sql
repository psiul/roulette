select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 31 and ss.ss_hash <= 781 and i.i_hash >= 159 and i.i_hash <= 559 and hd.hd_hash >= 459 and hd.hd_hash <= 792
;
