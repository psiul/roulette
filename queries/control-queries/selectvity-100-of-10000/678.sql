select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 725 and ss.ss_hash <= 925 and hd.hd_hash >= 382 and hd.hd_hash <= 882 and cd.cd_hash >= 49 and cd.cd_hash <= 149
;
