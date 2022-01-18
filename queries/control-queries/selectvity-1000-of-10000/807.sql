select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 80 and ss.ss_hash <= 413 and cd.cd_hash >= 6 and cd.cd_hash <= 406 and d.d_hash >= 111 and d.d_hash <= 861
;
