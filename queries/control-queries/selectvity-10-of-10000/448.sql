select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 148 and cd.cd_hash <= 198 and i.i_hash >= 554 and i.i_hash <= 654 and hd.hd_hash >= 616 and hd.hd_hash <= 816
;
