select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 434 and ss.ss_hash <= 767 and cd.cd_hash >= 584 and cd.cd_hash <= 984 and i.i_hash >= 65 and i.i_hash <= 815
;
