select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 411 and ss.ss_hash <= 811 and d.d_hash >= 545 and d.d_hash <= 878 and hd.hd_hash >= 243 and hd.hd_hash <= 993
;
