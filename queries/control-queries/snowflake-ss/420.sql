select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 236 and ss.ss_hash <= 986 and hd.hd_hash >= 11 and hd.hd_hash <= 344 and d.d_hash >= 516 and d.d_hash <= 916
;
