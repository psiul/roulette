select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 33 and ss.ss_hash <= 783 and hd.hd_hash >= 495 and hd.hd_hash <= 828 and d.d_hash >= 357 and d.d_hash <= 757
;
