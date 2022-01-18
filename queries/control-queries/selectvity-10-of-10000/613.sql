select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 696 and d.d_hash <= 796 and cd.cd_hash >= 206 and cd.cd_hash <= 256 and i.i_hash >= 726 and i.i_hash <= 926
;
