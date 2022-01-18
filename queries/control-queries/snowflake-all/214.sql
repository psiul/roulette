select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 21 and i.i_hash <= 771 and cd.cd_hash >= 92 and cd.cd_hash <= 425 and hd.hd_hash >= 396 and hd.hd_hash <= 796
;
