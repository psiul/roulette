select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 62 and ss.ss_hash <= 812 and i.i_hash >= 596 and i.i_hash <= 996 and hd.hd_hash >= 31 and hd.hd_hash <= 364
;
