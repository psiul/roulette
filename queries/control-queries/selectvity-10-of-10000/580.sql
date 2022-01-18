select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 899 and i.i_hash <= 949 and cd.cd_hash >= 386 and cd.cd_hash <= 586 and hd.hd_hash >= 157 and hd.hd_hash <= 257
;
