select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 98 and ss.ss_hash <= 848 and hd.hd_hash >= 73 and hd.hd_hash <= 406 and i.i_hash >= 58 and i.i_hash <= 458
;
