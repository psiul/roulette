select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 234 and i.i_hash <= 984 and d.d_hash >= 454 and d.d_hash <= 787 and hd.hd_hash >= 174 and hd.hd_hash <= 574
;
