select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 209 and i.i_hash <= 409 and d.d_hash >= 448 and d.d_hash <= 948 and hd.hd_hash >= 523 and hd.hd_hash <= 623
;
