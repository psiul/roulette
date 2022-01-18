select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 579 and ss.ss_hash <= 679 and cd.cd_hash >= 515 and cd.cd_hash <= 565 and hd.hd_hash >= 429 and hd.hd_hash <= 629
;
