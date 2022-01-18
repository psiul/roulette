select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 525 and ss.ss_hash <= 725 and d.d_hash >= 153 and d.d_hash <= 253 and hd.hd_hash >= 610 and hd.hd_hash <= 660
;
