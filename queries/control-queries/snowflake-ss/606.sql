select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 353 and hd.hd_hash <= 686 and cd.cd_hash >= 206 and cd.cd_hash <= 956 and i.i_hash >= 560 and i.i_hash <= 960
;
