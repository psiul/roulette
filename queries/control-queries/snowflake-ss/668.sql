select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 580 and ss.ss_hash <= 980 and hd.hd_hash >= 9 and hd.hd_hash <= 759 and i.i_hash >= 224 and i.i_hash <= 557
;
