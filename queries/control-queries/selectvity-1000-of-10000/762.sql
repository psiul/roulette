select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 480 and ss.ss_hash <= 813 and cd.cd_hash >= 303 and cd.cd_hash <= 703 and d.d_hash >= 42 and d.d_hash <= 792
;
