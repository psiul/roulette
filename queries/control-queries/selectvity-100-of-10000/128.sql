select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 174 and ss.ss_hash <= 674 and cd.cd_hash >= 509 and cd.cd_hash <= 609 and d.d_hash >= 318 and d.d_hash <= 518
;
