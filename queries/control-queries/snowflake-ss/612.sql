select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 87 and cd.cd_hash <= 420 and hd.hd_hash >= 129 and hd.hd_hash <= 879 and i.i_hash >= 380 and i.i_hash <= 780
;
