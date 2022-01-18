select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 148 and ss.ss_hash <= 168 and d.d_hash >= 480 and d.d_hash <= 530 and hd.hd_hash >= 504 and hd.hd_hash <= 604
;
