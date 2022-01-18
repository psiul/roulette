select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 110 and ss.ss_hash <= 860 and hd.hd_hash >= 97 and hd.hd_hash <= 430 and d.d_hash >= 585 and d.d_hash <= 985
;
