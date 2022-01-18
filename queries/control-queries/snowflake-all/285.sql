select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 198 and ss.ss_hash <= 531 and hd.hd_hash >= 128 and hd.hd_hash <= 878 and d.d_hash >= 162 and d.d_hash <= 562
;
