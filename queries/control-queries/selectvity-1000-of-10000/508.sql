select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 48 and i.i_hash <= 798 and hd.hd_hash >= 495 and hd.hd_hash <= 895 and d.d_hash >= 180 and d.d_hash <= 513
;
