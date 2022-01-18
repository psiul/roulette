select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 361 and ss.ss_hash <= 761 and i.i_hash >= 584 and i.i_hash <= 917 and hd.hd_hash >= 108 and hd.hd_hash <= 858
;
