select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 461 and i.i_hash <= 794 and d.d_hash >= 478 and d.d_hash <= 878 and hd.hd_hash >= 202 and hd.hd_hash <= 952
;
