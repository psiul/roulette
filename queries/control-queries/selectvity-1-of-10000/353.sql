select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 358 and ss.ss_hash <= 458 and hd.hd_hash >= 788 and hd.hd_hash <= 838 and d.d_hash >= 150 and d.d_hash <= 170
;
