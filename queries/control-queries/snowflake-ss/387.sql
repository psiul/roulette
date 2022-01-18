select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 355 and ss.ss_hash <= 688 and hd.hd_hash >= 95 and hd.hd_hash <= 495 and i.i_hash >= 222 and i.i_hash <= 972
;
