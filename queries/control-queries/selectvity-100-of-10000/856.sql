select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 566 and hd.hd_hash <= 666 and cd.cd_hash >= 99 and cd.cd_hash <= 299 and i.i_hash >= 266 and i.i_hash <= 766
;
