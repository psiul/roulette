select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 164 and hd.hd_hash <= 914 and i.i_hash >= 563 and i.i_hash <= 896 and d.d_hash >= 65 and d.d_hash <= 465
;
