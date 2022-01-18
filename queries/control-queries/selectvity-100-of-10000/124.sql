select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 125 and cd.cd_hash <= 225 and hd.hd_hash >= 192 and hd.hd_hash <= 692 and d.d_hash >= 107 and d.d_hash <= 307
;
