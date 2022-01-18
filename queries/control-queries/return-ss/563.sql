select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 462 and ss.ss_hash <= 795 and cd.cd_hash >= 518 and cd.cd_hash <= 918 and i.i_hash >= 139 and i.i_hash <= 889
;
