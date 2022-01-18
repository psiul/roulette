select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 844 and hd.hd_hash <= 944 and d.d_hash >= 642 and d.d_hash <= 692 and cd.cd_hash >= 748 and cd.cd_hash <= 768
;
