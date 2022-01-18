select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 509 and ss.ss_hash <= 909 and hd.hd_hash >= 85 and hd.hd_hash <= 835 and d.d_hash >= 108 and d.d_hash <= 441
;
