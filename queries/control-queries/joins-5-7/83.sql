select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and i.i_hash >= 446 and i.i_hash <= 846 and hd.hd_hash >= 54 and hd.hd_hash <= 387
;
