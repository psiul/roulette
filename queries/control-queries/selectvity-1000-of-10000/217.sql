select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 255 and ss.ss_hash <= 588 and d.d_hash >= 172 and d.d_hash <= 922 and hd.hd_hash >= 455 and hd.hd_hash <= 855
;
