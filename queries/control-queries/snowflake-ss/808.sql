select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 48 and hd.hd_hash <= 798 and cd.cd_hash >= 211 and cd.cd_hash <= 611 and i.i_hash >= 175 and i.i_hash <= 508
;
