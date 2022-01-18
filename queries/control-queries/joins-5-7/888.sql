select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 365 and ss.ss_hash <= 765 and hd.hd_hash >= 29 and hd.hd_hash <= 779 and d.d_hash >= 368 and d.d_hash <= 701
;
