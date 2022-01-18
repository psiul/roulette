select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 39 and ss.ss_hash <= 59 and hd.hd_hash >= 911 and hd.hd_hash <= 961 and d.d_hash >= 103 and d.d_hash <= 203
;
