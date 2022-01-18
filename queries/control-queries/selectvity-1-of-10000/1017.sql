select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 349 and ss.ss_hash <= 369 and d.d_hash >= 635 and d.d_hash <= 685 and cd.cd_hash >= 425 and cd.cd_hash <= 525
;
