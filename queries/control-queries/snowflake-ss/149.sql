select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 579 and ss.ss_hash <= 912 and cd.cd_hash >= 206 and cd.cd_hash <= 606 and i.i_hash >= 61 and i.i_hash <= 811
;
