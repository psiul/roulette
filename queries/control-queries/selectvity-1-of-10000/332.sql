select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 874 and cd.cd_hash <= 894 and i.i_hash >= 87 and i.i_hash <= 187 and hd.hd_hash >= 634 and hd.hd_hash <= 684
;
