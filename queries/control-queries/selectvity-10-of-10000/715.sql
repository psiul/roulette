select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 278 and ss.ss_hash <= 378 and d.d_hash >= 444 and d.d_hash <= 494 and hd.hd_hash >= 320 and hd.hd_hash <= 520
;
