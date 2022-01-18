select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 187 and ss.ss_hash <= 937 and d.d_hash >= 90 and d.d_hash <= 490 and cd.cd_hash >= 651 and cd.cd_hash <= 984
;
