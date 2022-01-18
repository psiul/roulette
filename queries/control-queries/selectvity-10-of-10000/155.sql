select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 646 and ss.ss_hash <= 746 and hd.hd_hash >= 68 and hd.hd_hash <= 118 and i.i_hash >= 174 and i.i_hash <= 374
;
