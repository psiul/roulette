select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 33 and d.d_hash <= 533 and hd.hd_hash >= 413 and hd.hd_hash <= 613 and i.i_hash >= 701 and i.i_hash <= 801
;
