select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 547 and hd.hd_hash <= 947 and cd.cd_hash >= 114 and cd.cd_hash <= 447 and i.i_hash >= 23 and i.i_hash <= 773
;
