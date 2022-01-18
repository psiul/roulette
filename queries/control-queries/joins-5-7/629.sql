select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 444 and ss.ss_hash <= 777 and cd.cd_hash >= 218 and cd.cd_hash <= 968 and hd.hd_hash >= 95 and hd.hd_hash <= 495
;
