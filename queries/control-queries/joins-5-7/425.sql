select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 239 and i.i_hash <= 639 and d.d_hash >= 384 and d.d_hash <= 717 and hd.hd_hash >= 112 and hd.hd_hash <= 862
;
