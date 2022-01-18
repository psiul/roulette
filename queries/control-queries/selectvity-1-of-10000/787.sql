select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 923 and ss.ss_hash <= 943 and i.i_hash >= 463 and i.i_hash <= 513 and cd.cd_hash >= 496 and cd.cd_hash <= 596
;
