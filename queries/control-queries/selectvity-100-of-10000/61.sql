select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 896 and d.d_hash <= 996 and i.i_hash >= 308 and i.i_hash <= 808 and cd.cd_hash >= 735 and cd.cd_hash <= 935
;
